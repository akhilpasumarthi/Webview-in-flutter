import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sai/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FourthScreen extends StatefulWidget {

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<int> _getint()async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setInt('clicks',1);

  }
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
                    image: AssetImage("images/Group 2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.1,),
              Center(
                child: Text("Get Offers", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05  ,),
              Center(
                child: Container(
                    width: 300,
                    child: Text("Get cashback offers & huge discounts everyday", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), textAlign: TextAlign.center,)
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Center(
                child: InkWell(
                  onTap: () async{
                    _getint();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => url()));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                          begin:Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffff893b),
                            Color(0xffff0053),
                          ]
                      ),
                    ),
                    child: Center(
                      child: Text('Get Started', style: TextStyle(color:Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}