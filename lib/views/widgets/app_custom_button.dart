import 'package:flutter/material.dart';

class AppCustomButton extends StatelessWidget {
  double? hight;
  double? width;
  String? title;
  TextStyle? titleStyle;
  IconData? icon;
  Function() onPressed;
  Color? backgroundColor;
  double? shade;
  double? iconSize;
  double? borderRadius;


  AppCustomButton({this.hight,
    this.width,this.title,
    this.icon,required this.onPressed,
    this.backgroundColor,
    this.shade,this.borderRadius,this.titleStyle,
    this.iconSize,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(shade??2),
        height: hight??55,
        width: width??double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius??5)),
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.5,
              1.0,
            ],
            colors: [
              const Color(0xFF878787),
              const Color(0xFF878787).withOpacity(0),
            ],
          ),
        ),
        child: Container(
            decoration: BoxDecoration(
              color:backgroundColor??const Color(0xFF383333),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius??5)),
              shape: BoxShape.rectangle,
            ),
            child:icon==null? Center(
              child: Text(
                title??"ACCEPT",style: titleStyle??TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ):Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon,size: iconSize??18,),
                Text(
                  title??"ACCEPT",style: titleStyle??TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ],
            )

        ),
      ),
    );
  }
}
