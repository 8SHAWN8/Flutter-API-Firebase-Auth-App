import 'dart:convert';


import 'package:app/page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {
  Future<Response> shawn() async {
    return await get(Uri.parse("https://fakestoreapi.com/products"));
  }

  late Future<Response> response;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    response = shawn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Info of a API'),
          ),
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
                  image: AssetImage("assets/login.jpg"),
                ),
              ),
              child: Container(
                child: FutureBuilder<Response>(
                    future: response,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData) {
                        String body = snapshot.data!.body;
                        List<dynamic> data = jsonDecode(body);
                        return GridView.builder(
                            padding: EdgeInsets.all(30.0),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    // childAspectRatio: 6,
                                    crossAxisSpacing: 100,
                                    mainAxisSpacing: 100),
                            itemCount: data.length,
                            // itemCount: myProducts.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDetailsScreen(
                                          data: data[index],
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  child: Image.network(
                                    data[index]["image"],
                                    fit: BoxFit.cover,
                                  ),

                                  // child: Text(myProducts[index]["name"]),
                                  // decoration: BoxDecoration(
                                  //     color: Colors.black45,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              );
                            });
                      }

                      return CircularProgressIndicator();
                    }),
              ),
            ),
          ),
        ));
  }
}
