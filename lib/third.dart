import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sai/fourth.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height*0.15,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Image(
                    image: AssetImage("images/third.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.1,),
              Center(
                child: Text("Get Delivered", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05  ,),
              Center(
                child: Container(
                    width: 300,
                    child: Text("fashion right at your doorstep just one click away", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), textAlign: TextAlign.center,)
                ),
              ),
            ],
          ),
        )
    );
  }
}