

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../style/style.dart';
import '';
import 'ProductGridViewScreen.dart';

class ProductUpdateScreen extends StatefulWidget  {
  final Map productItem ;
  const ProductUpdateScreen(this.productItem);


  @override
  State<ProductUpdateScreen> createState()  => _ProductCretationScreen ();
}
// view ney kaj kore
class _ProductCretationScreen  extends State<ProductUpdateScreen>{
  //api modhe key & val 2 tai string
  Map<String,String> FormValues = {
    "Img" : "",
    "Productcode" : "",
    "ProductName" : "",
    "Qty" : "",
    "TotalPrice" : "",
    "UniPrice" : "",
  } ;
  bool Loading = false ;
  //ak func sob kaj korbo

    void initState() {
     setState(() {
       FormValues.update("Img", (value) => widget.productItem['Img']) ;
       FormValues.update("ProductCode", (value) => widget.productItem['ProductCode']) ;
       FormValues.update("ProductName", (value) => widget.productItem['ProductName']) ;
       FormValues.update("Qty", (value) => widget.productItem['Qty']) ;
       FormValues.update("TotalPrice", (value) =>widget.productItem['TotalPrice']) ;
       FormValues.update("UnitPrice", (value) => widget.productItem['UnitPrice']) ;
     });
    }

  Inputonchnage( Mapkey , Textvalue ){
    setState(() {
      //FormValues  property gulake updte korbo
      // FormValues.update(Mapkey, (Textvalue)>=null) ;

      FormValues.update(Mapkey, (value) => Textvalue) ;


    });
  }

  FormOnsubmit() async {
    if(FormValues['Img']!.isEmpty) {
      ErrorTost("Image link requried ! ");
    }

    // String img = FormValues['Img'] ?? "";
    //
    // if (img.isEmpty) {
    //   ErrorTost("No image found");
    // } else if (!(img.toLowerCase().endsWith(".jpg") ||
    //     img.toLowerCase().endsWith(".jpeg") ||
    //     img.toLowerCase().endsWith(".png") ||
    //     img.toLowerCase().endsWith(".gif"))) {
    //   ErrorTost("Invalid image format");
    // }

    else if(FormValues['Productcode']!.isEmpty) {
      ErrorTost("no product  found ");

    } else if(FormValues['ProductName']!.isEmpty) {
      ErrorTost(" ProductName needded ");

    }
    else if(FormValues['Qty']!.isEmpty) {
      ErrorTost(" ProductName Qty !! ");
    }
    else if(FormValues['TotalPrice']!.isEmpty) {
      ErrorTost(" ProductName priceeeee!!1 ");
    }
    else if(FormValues['UniPrice']!.isEmpty) {
      ErrorTost(" ProductName UniPrice needded ");
    }
    // } if(FormValues['Img']!.length==0) {
    //
    // } if(FormValues['Img']!.length==0) {
    //
    // } if(FormValues['Img']!.length==0) {
    //
    // }
    else{
      setState(() {
        Loading = true ;
      });
      await ProductUpdateRequest (FormValues , widget.productItem['_id']);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Productgridviewscreen(FormValues),
        ),
            (Route<dynamic> route) => false,
      );

      // setState(() {
      //   Loading = false ;
      // });

    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:  Text('Create Product'),),
      body: Stack(
        children: <Widget>[
          ScreenBackground(context),
          // background grapchics
          Container(
            child: Loading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Product Name
                  TextFormField(
                    initialValue: FormValues['ProductName'],
                    onChanged: (Textvalue) {
                      Inputonchnage("ProductName", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(height: 20),

                  // Product Image (URL)
                  TextFormField(
                    initialValue: FormValues['Img'],
                    onChanged: (Textvalue) {
                      Inputonchnage("Img", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Image URL'),
                  ),
                  const SizedBox(height: 20),

                  // Unit Price
                  TextFormField(
                    initialValue: FormValues['UniPrice'],
                    onChanged: (Textvalue) {
                      Inputonchnage("UniPrice", Textvalue);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  const SizedBox(height: 20),

                  // Product Code
                  TextFormField(
                    initialValue:FormValues['Productcode'],
                    onChanged: (Textvalue) {
                      Inputonchnage("Productcode", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(height: 20),

                  // Total Price
                  TextFormField(
                    initialValue: FormValues['TotalPrice'],
                    onChanged: (Textvalue) {
                      Inputonchnage("TotalPrice", Textvalue);
                    },
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  const SizedBox(height: 20),

                  // Quantity Dropdown
                  Appdropdownstyle(
                    DropdownButton(
                      value: FormValues['Qty'],
                      items: const [
                        DropdownMenuItem(child: Text('Select Qty'), value: ''),
                        DropdownMenuItem(child: Text('1 piece'), value: '1'),
                        DropdownMenuItem(child: Text('2 pieces'), value: '2'),
                        DropdownMenuItem(child: Text('3 pieces'), value: '3'),
                        DropdownMenuItem(child: Text('4 pieces'), value: '4'),
                        DropdownMenuItem(child: Text('5 pieces'), value: '5'),
                      ],
                      onChanged: (Textvalue) {
                        Inputonchnage("Qty", Textvalue);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppButtonstyle(),
                      onPressed: () {
                        FormOnsubmit();
                      },
                      child: SuccessButtonChild("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          )


        ],
      ),
      /*
      Stack is a layout widget. It overlaps its children on top of each other — like layers.
      Think of it like a pile of widgets, where each one can be positioned on top of the previous ones.
       */
    );


  }
}