import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  double? hight;
  double? width;
  Color? backgroundColor;
  double? shade;

  FormFieldValidator<String>? validator;
  IconData? icon;
  String? errorMessage;
  bool? obscureText;
  String? hint;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextEditingController? controller;
  double? borderRadius;
  CustomTextFormField({this.hight,this.width,this.borderRadius,
    this.shade,this.backgroundColor,this.keyboardType,this.hint,
    this.hintStyle,this.obscureText,this.errorMessage,
    this.validator,
    this.controller,this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8,),
        Container(
          padding: EdgeInsets.all(shade??2),
          height: hight??55,
          width: width??double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??5)),
            shape: BoxShape.rectangle,
            color:const Color(0xFF878787),

          ),
          child: Container(
            decoration: BoxDecoration(
              color:backgroundColor??const Color(0xFF383333),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius??5)),
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: TextFormField(
                controller: controller,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                keyboardType: keyboardType,
                obscureText: obscureText??false,
                decoration: InputDecoration(
                  prefixIcon: Icon(icon??Icons.mail_outline,color: Colors.white,),
                  hintText:hint??"Enter ",
                  hintStyle:hintStyle??const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  errorStyle:const TextStyle(fontSize: 0),
                ),
                validator: validator,
              ),
            ),
          ),
        ),
        errorMessage!=null?const SizedBox(height: 8,):const SizedBox(),
        errorMessage!=null?Text(errorMessage.toString(),style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Colors.red),):const SizedBox(),
      ],
    );
  }
}
