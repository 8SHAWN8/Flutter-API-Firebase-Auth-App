
import 'package:app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Singup extends StatelessWidget {
  static const Route = '';
  var mail = '';
  var password = '';
  Singup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 200,
              ),
             
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  onChanged:(v)=>mail=v,
                  decoration: InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Inter your email'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
             
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(onChanged:(v)=>password=v,
                  decoration: InputDecoration(
                    
                      label: Text('Password'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Set a Password'),
                ),
              ),
             
              SizedBox(
                height: 50,
                width: 50,
              ),
              Column(
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context)
                  //         .push(MaterialPageRoute(builder: (context) => Login()));
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 10),
                  //     child: Text("Log in"),
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30)),
                  //     minimumSize: Size(double.infinity, 0),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minimumSize: Size(double.infinity, 0),
                      shadowColor: Colors.black,
                    ),
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("creating..."),
                        ),
                      );
                      print("creating...");
                          UserCredential userCredential;
                          try {
                            userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: mail,
                              password: password,
                            );
                            if(userCredential.user != null){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Done"),
                                ),
                              );
                              print("Done!");
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Login()));
                            } else{
                              //TODO: handle error
                              print("unknown_error");
                            }

                          } on FirebaseAuthException catch (e){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.code),
                              ),
                            );
                          print(e.code);
                            //TODO: handale error
                          
                          }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Create Account"),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
