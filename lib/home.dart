

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sai/fourth.dart';
import 'package:sai/second.dart';
import 'package:sai/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var clicks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInt();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => second()));
    });

  }

  void data(){

    _getInt();
  }
  Future<int> _getInt() async{
    final prefs=await SharedPreferences.getInstance();
    clicks= prefs.getInt('clicks');
    if (clicks==1)
    {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => url()));

    }
    else {

    }
    }
    geturl() async{
      final String urlString = "http://saicollections.co";
      if(await canLaunch(urlString)){
        launch(
          urlString,
          forceSafariVC: false,
          forceWebView: true,
        );
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical:30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffff893b),
              Color(0xffff0053),
            ]
          )
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.3,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(letterSpacing: 1),
                          children: [
                            TextSpan(text: 'Sa', style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w500),),
                            TextSpan(text: 'i', style: TextStyle(color: Colors.black, fontSize: 60, fontWeight: FontWeight.w500)),
                          ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 5,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  child: Text('collections', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),)
              )
            ],
          )
        ),
      ),
    );
  }
}
