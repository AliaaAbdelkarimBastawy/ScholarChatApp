import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/views/SignUpView.dart';
import '../components/CustomBtn.dart';
import '../components/CustomTxtFormField.dart';
import '../constants.dart';
import '../helper/show_snack_bar.dart';
import 'ChatView.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController EmailController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key:formKey,
            child: Column(
              children: [
                const Spacer(flex: 2,),
                Image.asset(kLogo),
                const Text("Scholar Chat",
                  style: TextStyle(fontSize: 32,
                    color: Colors.white,
                    fontFamily: "Pacifico",
                  ),),
                const Spacer(flex: 1,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("LOGIN",
                      style: TextStyle(fontSize: 24,
                        color: Colors.white,
                      ),),
                  ],),
                const SizedBox(height: 8,),
                CustomTxtFormFieldWidget(
                  hintTxt: 'Email',
                  controller: EmailController,
                  validator: (data) {
                    if(data!.isEmpty)
                    {
                      return "Email cannot be Empty!";
                    }
                    else
                    {
                      return null;
                    }
                  },),
                const SizedBox(height: 16,),
                CustomTxtFormFieldWidget(
                  obscureTest: true,
                  hintTxt: 'Password',
                  controller: PasswordController,
                  validator: (data) {
                    if(data!.isEmpty)
                    {
                      return "Password cannot be Empty!";
                    }
                    else
                    {
                      return null;
                    }
                  },),
                const SizedBox(height: 32,),
                CustomBtn(btnTxt: "Login",
                  onTap: () async {
                    if(formKey.currentState!.validate())
                    {

                      setState(() {
                        isLoading = true;
                      });
                      try
                      {
                        await LoginUser(EmailController, PasswordController);
                        // ShowSnackBar(context, "User Logged Successfully", Colors.green);
                        Navigator.pushNamed(context, ChatView.id, arguments: EmailController.text);

                      } on FirebaseAuthException catch(ex)
                      {
                        if(ex.code == 'user-not-found') {
                          print("ERRORRR1");
                          ShowSnackBar(context, "No user found for that email", Colors.red);
                        }

                        else if(ex.code == 'wrong-password') {
                          print("ERRORRR2");
                          ShowSnackBar(context,"Wrong password provided for that user", Colors.red);
                        }

                      } catch(ex)
                      {
                        print("ERRORRR3");
                        ShowSnackBar(context,ex.toString(), Colors.red);
                      }


                      setState(() {
                        isLoading = false;
                      });
                    }
                    else
                    {
                    }
                  },),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                      style: TextStyle(color: Colors.white),),
                    const SizedBox(width: 8,),
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.pushNamed(context, SignUpView.id);
                      },
                      child: const Text("Sign Up",
                        style: TextStyle(color: Color(0xFFC7EDE6)),),
                    ),
                  ],),
                const Spacer(flex: 4,),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> LoginUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    //This code is used to create User account on Firebase
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
  }
}
