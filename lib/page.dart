import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final data;
  const ProductDetailsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      body: Card(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Price"),
            Text(
              data['price'].toString(),
              style: TextStyle(fontSize: 50),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 23, 20, 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Product details",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                10,
                0,
                10,
                0,
              ),
              child: Text(
                data['title'].toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
