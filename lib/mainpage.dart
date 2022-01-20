import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'singup.dart';

bool isHidPassword = false;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<MainPage> {
  var mail = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5),
                  BlendMode.multiply,
                ),
                fit: BoxFit.cover,
                image: AssetImage("assets/mainpage.jpg"),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjUsW5wFKueOqsdpKIKjshu5DfE02XqDbz3yZbECN0_XldYesyDrOwJVRMSYW8bTEIMcc&usqp=CAU",
                            ),
                            radius: 60,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      // TextField(
                      //   decoration: InputDecoration(
                      //     label: Text("Username"),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(23),
                      //       ),
                      //     ),

                      //     hintText: 'Enter your Name',
                      //     // icon: Icon(
                      //     //   Icons.person_outline_rounded,
                      //     //   size: 40,
                      //     // ),
                      //     prefixIcon: Icon(Icons.person),
                      //   ),
                      // ),
                      SizedBox(height: 24),
                      TextField(
                        onChanged: (v) => mail = v,

                        textInputAction: TextInputAction.done,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Email address"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(23),
                            ),
                          ),

                          hintText: 'Enter your Email address',
                          // icon: Icon(
                          //   Icons.person_outline_rounded,
                          //   size: 40,
                          // ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        onChanged: (v) => password = v,
                        decoration: InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(23),
                            ),
                          ),

                          hintText: 'Enter your password',
                          // icon: Icon(
                          //   Icons.person_outline_rounded,
                          //   size: 40,
                          // ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                              // onTap: _tappassword,
                              child: Icon(Icons.visibility)),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                SizedBox(width: 2),
                                Text('forget password?'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            minimumSize: Size(double.infinity, 35)),
                        onPressed: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Log in...."),
                            ),
                          );
                          print("Log in.....");
                          UserCredential userCredential;
                          try {
                            userCredential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: mail, password: password);
                            if (userCredential.user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Done"),
                                ),
                              );
                              print("Done!");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Unknown Error"),
                                ),
                              );
                              print("Unknown Error");
                            }
                          } on FirebaseAuthException catch (e) {
                            print(e.code);
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            minimumSize: Size(double.infinity, 35)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Singup()));
                        },
                        child: Text(
                          "Sing up",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      const Text("--------------Or Connect with-------------"),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Icon(Icons.facebook),
                                SizedBox(width: 6),
                                Text('Facebook'),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: const [
                                CircleAvatar(
                                    backgroundColor: Colors.white24,
                                    radius: 14,
                                    child: Text(
                                      "G",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                SizedBox(width: 6),
                                Text('google'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// void _tappassword() {
//   // if (isHidPassword == true) {
//   //   isHidPassword = false;
//   // } else {
//   //   isHidPassword = true;
//   // }
//   setState(() {
//     isHidPassword = !isHidPassword;
//   });
// }
}
