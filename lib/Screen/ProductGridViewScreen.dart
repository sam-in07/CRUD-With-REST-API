import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/RestAPI/RestClient.dart';
import 'package:rest_api/Screen/ProductCreateScreen.dart';

import '../style/style.dart';
import 'ProductUpdateScreen.dart';

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

  DeleteItem(id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete!"),
          content: Text("Once deleted, you can't get it back."),
          actions: [
            OutlinedButton(
              onPressed: () async {
                // SuccessTost(id) ;
             // var result =
                Navigator.pop(context);
                setState(() {
                  isloading = true ;
                });
               await   ProductDeleteRequest(id);
               // setState(() {
               //   isloading = true ;
               // });
               await CallData();
              },
              child: Text('Yes'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        ); // AlertDialog
      },
    );
  }
  GotoUpdate(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            ProductUpdateScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: isloading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                child: GridView.builder(
                  gridDelegate: ProductGridViewStyle(),
                  itemCount: ProductList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              ProductList[index]['Img'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5,5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ProductList[index]['ProductName'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 7,) ,
                                Text("Price : " + ProductList[index]['UnitPrice'] + " BDT ") ,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(onPressed: () {
                                   //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductUpdateScreen()));
                                      GotoUpdate(context);
                                    },
                                        child: Icon(CupertinoIcons.ellipsis_vertical_circle
                                          , size: 18 , color: colorRed,)),
                                    SizedBox(width: 4,),
                                    OutlinedButton(onPressed: () {
                                         DeleteItem(ProductList[index]['_id']);
                                    },
                                        child: Icon(CupertinoIcons.delete)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                onRefresh: () async {
                  await CallData();
                }
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCretationScreen()));
        },
        child: Icon(Icons.add),
      )
    );
  }


}

