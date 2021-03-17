import 'package:flutter/material.dart';

Widget AppBarMain(BuildContext context)
{
  return AppBar(
    title: Image.asset("assects/images/logo.png",
    height: 50,)

  );
}

InputDecoration textFieldDecoration(String hint)
{
  return InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color : Colors.white54
                ),
                focusedBorder : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),

                ),
                enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:Colors.white54)
                ),
              );
}

TextStyle SimpleTextStyle()
{
  return TextStyle(color: Colors.white,fontSize:16);
}
TextStyle MediumTextStyle()
{
  return TextStyle(color: Colors.white,fontSize:17);
}
TextStyle LargeTextStyle()
{
  return TextStyle(color: Colors.white,fontSize:18);
}