
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_api/const/app_strings.dart';
import 'package:news_app_with_api/const/reg_ex.dart';
import 'package:news_app_with_api/di_locator.dart';
import 'package:news_app_with_api/providers/app_helper_function_provider.dart';
import 'package:news_app_with_api/services/auth_services/authentication.dart';
import 'package:news_app_with_api/views/pages/auth/sign_up_page.dart';
import 'package:news_app_with_api/views/pages/landing/landing_page.dart';
import 'package:news_app_with_api/views/widgets/app_custom_button.dart';
import 'package:news_app_with_api/views/widgets/app_text_formfield_custom.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  static const String routeName="/signin";
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal: 13),
        child: Consumer<AppHelperFunctionProvider>(
          builder: (context,appValidatorProvider,_)=>Form(
            key:_formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login into Your Account",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                ),
                SizedBox(height: 24,),
                Center(child: CustomTextFormField(
                  hint: "Email Address",
                  keyboardType:TextInputType.emailAddress,
                  errorMessage: appValidatorProvider.emailError,
                  controller: emailController,
                  icon: Icons.email_outlined,
                  validator: (email){
                    return appValidatorProvider.emailError=appValidatorProvider.validetion(RegEx.emailValidationRegExp, email!, APP_ERROR_EMAIL);
                  },
                )),
                SizedBox(height: 24,),
                Center(child: CustomTextFormField(
                  hint: "Password",
                  keyboardType:TextInputType.visiblePassword,
                  obscureText: true,
                  errorMessage: appValidatorProvider.passwordError,
                  controller: passwordController,
                  icon: Icons.lock_outlined,
                  validator: (password){
                    return appValidatorProvider.passwordError=appValidatorProvider.validetion(RegEx.passwordRegExp, password!, APP_ERROR_PASS);
                  },
                )),
                SizedBox(height: 28,),
                AppCustomButton(title: "Sign In", onPressed: _signIn
                  ,backgroundColor: Color(0xFFF5F5F5),titleStyle:const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF252525)),),

                SizedBox(height: 28,),
                AppCustomButton(title: "Sign Up", onPressed: (){
                  Navigator.pushNamed(context, SignUpPage.routeName);
                },backgroundColor: Color(0xFFF5F5F5),titleStyle:const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF252525)),),


              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    try {
      final status = await AuthService.login(
          emailController.text, passwordController.text);
      if (status) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, LandingPage.routeName);
        }
      } else {
        AuthService.logout();
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

}
