import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class Resultdata extends StatefulWidget {
  @override
  Results createState() {
   
    return Results();
  }
}
class Results extends State<Resultdata>{
  final dbRef = FirebaseDatabase.instance.reference().child("records");
  DataSnapshot snapshot;
  var list;
  @override
  Widget build(BuildContext context) {
  return Column(
     children: <Widget>[
       Text("సాయి రామ్ కంకర"),
       RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    onPressed: () {
                      dbRef.once().then((DataSnapshot snapshot){});
                      loader();},
       ),
       ]);
                      }
                    
                      void loader() {
                         dbRef.child("2").once().then((DataSnapshot data){
                           print(data.value);
                           print(data.key);
                         }); 
                         }

  
    }