import 'package:flutter/material.dart';
import 'package:rest_api/RestAPI/RestClient.dart';

import '../style/style.dart';

class Productgridviewscreen extends StatefulWidget {
  const Productgridviewscreen({super.key});

  @override
  State<Productgridviewscreen> createState() => _ProductgridviewscreenState();
}

class _ProductgridviewscreenState extends State<Productgridviewscreen> {
  List ProductList = [];
  bool isloading = true;

  void initState() {
    super.initState();
    CallData();
  }
//component loadiing => call data method call => data load howya product a
  CallData() async {
    isloading = true ;
    var data  = await ProductGridViewListRequest();
    //call korsi
    setState(() {
      ProductList = data;
      isloading = false ;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: isloading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
              gridDelegate: ProductGridViewStyle(),
              itemCount: 10, // কতগুলো item দেখাবে
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                         Expanded(child: Image.network(ProductList[index]['Img'] , fit: BoxFit.fill) ),
                       ],
                  ),

                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
