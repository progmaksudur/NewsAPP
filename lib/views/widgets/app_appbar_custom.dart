import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  Widget? leading;
  Widget? ending;
  Widget? middle;
  String? amount;
  Function()? onPressed;
  String? profilePic;

  CustomAppBar({this.leading,this.middle,this.ending,this.amount,this.onPressed,this.profilePic,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 80,
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading?? Icon(Icons.ac_unit),
            const Spacer(),
            middle??Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color:const Color(0xFF4D4A4A),
                      width: 1,
                      style: BorderStyle.solid
                  )
              ),
              child: Center(
                child: Text(
                  amount??"0.00",
                ),
              ),
            ),
            const SizedBox(width: 15,),
            ending??InkWell(
              onTap: onPressed??(){

              },
              child:Container(
                height: 45,
                width: 45,
                decoration:BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(profilePic??"https://www.mountsinai.on.ca/wellbeing/our-team/team-images/person-placeholder/image"),
                      fit: BoxFit.fitHeight,
                    )
                ),
              ),
            )




          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity,80);
}