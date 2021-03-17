import 'package:chatwithyash/services/auth.dart';
import 'package:chatwithyash/views/chatroom.dart';
import 'package:chatwithyash/wdigets/wdiget.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  final Function toggle;
  signUp(this.toggle);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  AuthMethods authMethods = new AuthMethods();
  bool isloading = false;
  final formkey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signMeUp() {
    if (formkey.currentState.validate()) {
      setState(() {
        isloading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(context),
      body: isloading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 4
                                    ? "Please enter valid UserName"
                                    : null;
                              },
                              controller: userNameTextEditingController,
                              decoration: textFieldDecoration("username"),
                              style: SimpleTextStyle(),
                            ),
                            TextFormField(
                              controller: emailTextEditingController,
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Please Enter valid email";
                              },
                              decoration: textFieldDecoration("email"),
                              style: SimpleTextStyle(),
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.length < 6
                                    ? "Please enter valid Password"
                                    : null;
                              },
                              controller: passwordTextEditingController,
                              decoration: textFieldDecoration("password"),
                              style: SimpleTextStyle(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          signMeUp();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xff007EF4),
                                const Color(0xff2A75BC)
                              ]),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text("Sign Up", style: LargeTextStyle())),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text("Sign Up with google",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18))),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account?",
                            style: MediumTextStyle(),
                          ),
                          // SizedBox(width: 5,),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text("SignIn now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        decoration: TextDecoration.underline))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
