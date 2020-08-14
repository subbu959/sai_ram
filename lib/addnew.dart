import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'options.dart' as options;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class AddingNewData extends StatefulWidget {
  @override
  Addnewdata createState() {
    return Addnewdata();
  }
}
class Addnewdata extends State<AddingNewData>{ 
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("records");
  int key =1;
   String _metal = '';
   String _units = "";
   String _truck = "";
   String _status = "";
   TextEditingController controller1 = new TextEditingController();
   TextEditingController controller2 = new TextEditingController();
   TextEditingController controller3 = new TextEditingController();
   Widget build(BuildContext context) {
     return Column(
     children: <Widget>[ 
        SizedBox(height: 20,),
        TextFormField(
                      controller: controller1,
                      keyboardType: TextInputType.phone,
                      decoration: new InputDecoration(
                        labelText: "ఫోన్ నంబర్",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      )
       ),
       SizedBox(height: 20,),
       new TextFormField(
                       controller: controller2,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        labelText: "పేరు",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      )
       ),
       SizedBox(height: 20,),
       new TextFormField(
                       controller: controller3,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "డబ్బులు",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      )
       ),
       SizedBox(height: 20,),
        SmartSelect<String>.single(
          title: 'Metal Type',
          value: _metal,
          options: options.metal,
          onChange: (val) => setState(() => _metal = val),
          modalType: SmartSelectModalType.popupDialog,
        ),
        Divider(indent: 20),
        SmartSelect<String>.single(
          title: 'Units',
          value: _units,
          options: options.units,
          onChange: (val) => setState(() => _units = val),
          modalType: SmartSelectModalType.popupDialog,
        ),
        Divider(indent: 20),
        SmartSelect<String>.single(
          title: 'Truck',
          value: _truck,
          options: options.trucks,
          onChange: (val) => setState(() => _truck = val),
          modalType: SmartSelectModalType.popupDialog,
        ),
        Divider(indent: 20),
        SmartSelect<String>.single(
          title: 'Payment Status',
          value: _status,
          options: options.statuses,
          onChange: (val) => setState(() => _status = val),
          modalType: SmartSelectModalType.popupDialog,
        ),
        Divider(indent: 20),
        new SizedBox(
          width: 380,
         child:RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    onPressed: () {
                      uploader();
                    },
                        child: new Text("Add",),
                        ), )]);
                        }
                        void uploader() {
                          key+=1;
                      databaseReference.child("$key").push().set(
                        {   
                            "name":controller2.text,
                            "number":controller1.text,
                            "price": controller3.text,
                            "units": _units,
                            "metal": _metal,
                            "truck": _truck,
                            "status": _status
                        });
                        }
                                          
}

