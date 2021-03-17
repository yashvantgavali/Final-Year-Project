import 'package:chatwithyash/helper/Authentication.dart';
import 'package:chatwithyash/services/auth.dart';
import 'package:chatwithyash/views/signIn.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom({Key key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthMethods authMethods=new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  child: child,
      appBar: AppBar(
    title: Image.asset("assects/images/logo.png",
    height: 50,),
    actions: [
      GestureDetector(
        onTap: (){
                    authMethods.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Authentication()));
                  }, 
              child: Container(
          padding: EdgeInsets.symmetric(horizontal:16),
          child: Icon(Icons.exit_to_app)
        ),
      )
    ],

  ),
    );
  }
}