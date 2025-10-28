

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class ProductCretationScreen extends StatefulWidget  {
  @override
  State<ProductCretationScreen> createState()  => _ProductCretationScreen ();
}
// view ney kaj kore
class _ProductCretationScreen  extends State<ProductCretationScreen>{
  //api modhe key & val 2 tai string
  Map<String,String> FormValues = {
    "Img" : "",
    "Productcode" : "",
    "ProductName" : "",
    "Qty" : "",
    "TotalPrice" : "",
    "UniPrice" : "",
  } ;

  //ak func sob kaj korbo
  Inputonchnage( Mapkey , Textvalue ){
    setState(() {
      //FormValues  property gulake updte korbo
      // FormValues.update(Mapkey, (Textvalue)>=null) ;

      FormValues.update(Mapkey, (value) => Textvalue) ;


    });
  }

  FormOnsubmit() {
    if(FormValues['Img']!.length==0) {
      ErrorTost("no image found ");
    }
    else if(FormValues['Productcode']!.length==0) {
      ErrorTost("no product  found ");

    } else if(FormValues['ProductName']!.length==0) {
      ErrorTost(" ProductName needded ");

    } else if(FormValues['Qty']!.length==0) {
      ErrorTost(" ProductName Qty !! ");
    } else if(FormValues['TotalPrice']!.length==0) {
      ErrorTost(" ProductName priceeeee!!1 ");
    } else if(FormValues['UniPrice']!.length==0) {
      ErrorTost(" ProductName UniPrice needded ");
    }
    // } if(FormValues['Img']!.length==0) {
    //
    // } if(FormValues['Img']!.length==0) {
    //
    // } if(FormValues['Img']!.length==0) {
    //
    // }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:  Text('Create Product'),),
      body: Stack(
        children: [
          ScreenBackground(context),
          // background grapchics
          Container(
            child: (SingleChildScrollView (
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(onChanged: (Textvalue){
                    Inputonchnage("ProductName" , Textvalue ) ;
                    // 2 ta jinis key & value
                  },
                    decoration: AppInputDecoration('Product name '),

                  ),
                  SizedBox(height: 20,),
                  //akekta line mjhe space ar jonno
                  TextFormField(onChanged:  (Textvalue){
                    Inputonchnage("Produc IMG " , Textvalue ) ;
                    // 2 ta jinis key & value
                  },
                    decoration: AppInputDecoration('Product Image '),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(onChanged:  (Textvalue){
                    Inputonchnage("Product unit" , Textvalue ) ;
                    // 2 ta jinis key & value
                  },
                    decoration: AppInputDecoration('Product Unit prizze '),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(onChanged:  (Textvalue){
                    Inputonchnage("Product Code " , Textvalue ) ;
                    // 2 ta jinis key & value
                  },
                    decoration: AppInputDecoration('Product code  '),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(onChanged:  (Textvalue){
                    Inputonchnage("Product total prize" , Textvalue ) ;
                    // 2 ta jinis key & value
                  },
                    decoration: AppInputDecoration('Product total prize  '),

                  ) ,
                  // upur nicher jonoo
                  SizedBox(height: 20),

                  Appdropdownstyle(

                      DropdownButton(
                        value: FormValues['Qty'],
                        items: [
                          DropdownMenuItem(child: Text('select qt') , value: '',),
                          DropdownMenuItem(child: Text('1 pis ') , value: '1 pis',) ,
                          DropdownMenuItem(child: Text('2 pis') , value: '2 pis ',),
                          DropdownMenuItem(child: Text(' 3 pis ') , value: '3 pis ',),
                          DropdownMenuItem(child: Text('4 pis') , value: '4 pis ',),
                          DropdownMenuItem(child: Text('5 pis ') , value: '5 piss',),
                        ]

                        , onChanged:  (Textvalue){
                        Inputonchnage("Qty" , Textvalue ) ;
                        // 2 ta jinis key & value
                      },
                        underline: Container() ,
                        isExpanded: true,
                        //x exix borabor expends hoi jabe

                      )

                  ),

                  SizedBox(height: 20),
                  // buttton ta left to right pura space ta nibe Container dey shape
                  Container(
                    child: ElevatedButton(
                        style: AppButtonstyle(),
                        onPressed: () {
                          FormOnsubmit();
                        },
                        // child: Text("submit")),
                        child: SuccessButtonChild("submit")),
                    // SuccessButtonChild vitore akta  pura button ar design ase

                  )
                ],
              ),
            )),
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