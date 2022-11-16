import 'package:flutter/material.dart';
import 'package:uidemo/mobell.dart';
import 'package:uidemo/model.dart';
class secondpage extends StatefulWidget {
  // String? image;
  // String? name;
  // String? subtitle;
  // String? star;
  // String? table;
  // secondpage({Key? key,this.image,this.name,this.subtitle,this.star,this.table}) : super(key: key);
  Uimodel? model;
 // String? data;
  secondpage({Key? key,this.model,}) : super(key: key);



  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: (){
        Navigator.pop(context);
      },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 100.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Press Back"),
                ),
                Container(
                  width: 200,
                  child: Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(widget.model!.image!),
                            fit: BoxFit.fill)),
                  ),
                ),
                Text(widget.model!.name!),
                Text(widget.model!.subtitle!),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    Text(widget.model!.star!),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.table_restaurant,
                      color: Colors.red,
                    ),
                    Text(widget.model!.table!),
                  ],
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
