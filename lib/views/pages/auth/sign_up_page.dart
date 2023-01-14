


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_api/const/app_strings.dart';
import 'package:news_app_with_api/const/reg_ex.dart';
import 'package:news_app_with_api/di_locator.dart';
import 'package:news_app_with_api/providers/app_helper_function_provider.dart';
import 'package:news_app_with_api/services/auth_services/authentication.dart';
import 'package:news_app_with_api/views/pages/auth/sign_in_page.dart';
import 'package:news_app_with_api/views/widgets/app_custom_button.dart';
import 'package:news_app_with_api/views/widgets/app_text_formfield_custom.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = "/signup";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
        child: Consumer<AppHelperFunctionProvider>(
          builder: (context, appValidatorProvider, _) => Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create an Account",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                    child: CustomTextFormField(
                      hint: "Name",
                      keyboardType: TextInputType.name,
                      errorMessage: appValidatorProvider.nameError,
                      controller: nameController,
                      icon: Icons.person,
                      validator: (name) {
                        return appValidatorProvider.nameError =
                            appValidatorProvider.validetion(
                                RegEx.nameValidationRegExp,
                                name!,
                                APP_ERROR_NAME);
                      },
                    )),
                SizedBox(
                  height: 24,
                ),
                Center(
                    child: CustomTextFormField(
                      hint: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      errorMessage: appValidatorProvider.emailError,
                      controller: emailController,
                      icon: Icons.email_outlined,
                      validator: (email) {
                        return appValidatorProvider.emailError =
                            appValidatorProvider.validetion(
                                RegEx.emailValidationRegExp,
                                email!,
                                APP_ERROR_EMAIL);
                      },
                    )),
                SizedBox(
                  height: 24,
                ),
                Center(
                    child: CustomTextFormField(
                      hint: "Password",
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      errorMessage: appValidatorProvider.passwordError,
                      controller: passwordController,
                      icon: Icons.lock_outlined,
                      validator: (password) {
                        return appValidatorProvider.passwordError =
                            appValidatorProvider.validetion(
                                RegEx.passwordRegExp,
                                password!,
                                APP_ERROR_PASS);
                      },
                    )),
                SizedBox(
                  height: 52,
                ),
                AppCustomButton(
                  title: "SIGN UP",
                  onPressed: _save,
                  backgroundColor: Color(0xFFF5F5F5),
                  titleStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF252525)),
                ),
                SizedBox(
                  height: 24,
                ),
                AppCustomButton(
                  title: "SIGN IN",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, SignInPage.routeName);
                  },
                  backgroundColor: Color(0xFFF5F5F5),
                  titleStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF252525)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() async {

    try {
      AuthService.register(
        nameController.text,
        emailController.text,
        passwordController.text,
      ).then((value) => Navigator.pushNamedAndRemoveUntil(context, SignInPage.routeName, (route) => false));

    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
}
