
import 'package:flutter/material.dart';

Widget customErrorMessage(){
  return const Padding(
    padding: EdgeInsets.only(top: 15.0),
    child: Card(
      child: ListTile(
        leading: Icon(Icons.error,color: Colors.redAccent,),
        title: Text("Sorry, Data is not available !!",style: TextStyle(fontSize: 20,  color: Colors.black,fontFamily: 'Raleway-Bold',fontWeight: FontWeight.w700),),

      ),
    ),
  );
}