import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidemo/home_page.dart';
import 'package:uidemo/secondpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 7), () {
       Navigator.push(context,MaterialPageRoute(builder: (context) => MyuiDemo(),));
     // Navigator.pushReplacementNamed(context, "second_page",arguments: "Second");
    //  Navigator.of(context).popAndPushNamed('my_ui_page');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/e6/fa/6b/e6fa6b92decd26328f1f3616620b3e89.gif'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

// class Routing{
//   static Route? generateRoutes(RouteSettings settings){
//     switch(settings.name){
//       case "my_ui_page":
//         return MaterialPageRoute(builder: (context)=>MyuiDemo(
//         ));
//       case 'first_page':
//         return MaterialPageRoute(builder: (context)=>FirstPage());
//       case 'second_page':
//       // String data=routeSettings.arguments as String;
//         return MaterialPageRoute(builder: (context)=>secondpage(
//           // data:data
//         ));
//     }
//   }
// }
