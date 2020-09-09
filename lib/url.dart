import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class url extends StatefulWidget {
  @override
  _urlState createState() => _urlState();
}

class _urlState extends State<url> {
  FlutterWebviewPlugin webviews= FlutterWebviewPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  geturl() async{

    const url = "tel:8739927383";
    if(await canLaunch(url)) {
      launch(
    url
      );
    }
  }
  // void whatsAppOpen() async {
  //   await FlutterLaunch.launchWathsApp(phone: "919950738992", message:'');
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
          child: AppBar(
       automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
            elevation: 0,// hides leading widget

         )
         ),
      body: WebView(
        initialUrl: 'http://saicollections.co',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request)
        async {
          if (request.url.startsWith('https://api.whatsapp.com/send?phone=919950738992&text=&source=&data=&app_absent='))
          {
            print('blocking navigation to $request}');
            FlutterOpenWhatsapp.sendSingleMessage("919950738992", "Hello");


            return NavigationDecision.prevent;
          }
          if(request.url.startsWith("tel: +918739927383"))
            {
              print('blocking navigation to $request');
              geturl();
              return NavigationDecision.prevent;
            }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      )
    );

  }
}
