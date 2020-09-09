import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sai/fourth.dart';
import 'package:sai/slideBars.dart';
import 'package:sai/third.dart';

class second extends StatefulWidget {
  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  PageController _pageController = PageController(initialPage: 0);
  int curPage = 0;

  _changePage(int index){
    setState(() {
      curPage = index;
      _pageController.animateToPage(curPage, duration: Duration(milliseconds: 200), curve: Curves.slowMiddle);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(curPage<2)
      {
        curPage++;
        _pageController.animateToPage(curPage, duration: Duration(milliseconds: 200), curve: Curves.slowMiddle);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _changePage,
          children: <Widget>[
            SecondScreen(),
            ThirdScreen(),
            FourthScreen()
          ],
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for(int i=0;i<3;i++)
                if(i==curPage)
                  SlideBar(isSelected: true,)
                else
                  SlideBar(isSelected: false,)
            ],
          ),
        )
      ],
    );
  }
}



class SecondScreen extends StatelessWidget {
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
                    image: AssetImage("images/Group 3.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.1,),
              Center(
                child: Text("Stay Trendy", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05  ,),
              Center(
                child: Container(
                    width: 300,
                    child: Text("Thousands of variety for every size and person", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), textAlign: TextAlign.center,)
                ),
              ),
            ],
          ),
        )
    );
  }
}

