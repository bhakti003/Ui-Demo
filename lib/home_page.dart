import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:uidemo/model.dart';
import 'package:uidemo/secondpage.dart';

class MyuiDemo extends StatefulWidget {
  const MyuiDemo({Key? key}) : super(key: key);

  @override
  State<MyuiDemo> createState() => _MyuiDemoState();
}

class _MyuiDemoState extends State<MyuiDemo> {
  int SelectedIndex = 0;
  bool brekfast = false;
  bool lunch = false;
  bool snacks = false;
  bool dinner = false;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedIndex,
        iconSize: 20,
        onTap: (index) {
          setState(() {
            SelectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        elevation: 1,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff572ad4),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'FOOD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label: 'CARTS',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more,
              ),
              label: 'MORE')
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text('Sector 29,Gurgon'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/food3.jpeg'),
                  ),
                ],
              ),
              SizedBox(
                height: height-750,
              ),
              Container(
                // margin: EdgeInsets.only(bottom: 50,left: 20,right: 20),
                height: 20.h,
                width: 100.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/food5.jpeg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text(
                  'Quick Searches',
                  style: TextStyle(fontSize: 20, color: Color(0xff282d35)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 60,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 0.5,
                      spreadRadius: 2,
                      offset: Offset(0.1, 0.1),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 10, top: 3),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    brekfast = !brekfast;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                        brekfast
                                            ? Icons.sunny
                                            : Icons.wb_sunny_outlined,
                                        color: Colors.blue),
                                  CustomTextWidget(text: 'BreakFast',Size:15 ),
                                  ],
                                ),
                              ),
                                GestureDetector(onTap: (){
                                  setState((){
                                    lunch = !lunch;
                                  });
                                },
                                    child: Column(
                                      children: [
                                        Icon(lunch
                                                  ?Icons.sunny
                                                  :Icons.wb_sunny_outlined,
                                        color: Colors.yellow,),
                                        CustomTextWidget(text: 'Lunch',Size:12 ),
                                      ],
                                    ),
                                  ),
                                GestureDetector(onTap: (){
                                  setState((){
                                    snacks = !snacks;
                                  });
                                },
                                  child: Column(
                                    children: [
                                      Icon(snacks
                                                  ?Icons.sunny_snowing
                                                  :Icons.sunny_snowing,
                                      color: Colors.red,),
                                      CustomTextWidget(text: 'Snacks',Size: 12)
                                    ],

                                  ),
                                ),
                          GestureDetector(onTap: (){
                            setState((){
                              dinner = !dinner;
                            });
                          },
                            child: Column(
                              children: [
                                Icon(dinner
                                          ?Icons.nightlight
                                          :Icons.nightlight_outlined,
                                color: Colors.black,),
                                CustomTextWidget(text:'Dinner',Size: 12)
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(text: "Nearby Restaurant"),
                    CustomTextWidget(text: "View all", color: Colors.red),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                height: 300,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: uiList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => secondpage(
                                      // image: uiList[index].image!,
                                      // name: uiList[index].name!,
                                      // subtitle: uiList[index].subtitle!,
                                      // table: uiList[index].table!,
                                      // star: uiList[index].star!,
                                  model: uiList[index],
                                                                      )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Container(
                              height: 150,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(uiList[index].image!),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Text(uiList[index].name!),
                          Text(uiList[index].subtitle!),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              Text(uiList[index].star!),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.table_restaurant,
                                color: Colors.red,
                              ),
                              Text(uiList[index].table!),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Text CustomTextWidget({String? text, Color? color,double? Size}) {
    return Text(
      text ?? "HEy",
      style: TextStyle(fontSize: Size, color: color ?? Colors.black),
    );
  }
}
/*SizedBox(height:300, width: 350,
                  child: ListView.builder(
                    controller: controller,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: uiList.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),image: DecorationImage(image: AssetImage(uiList[index].image!),fit: BoxFit.fill)
                            ),
                           // child: Image.asset(uiList[index].image!,fit: BoxFit.fill,),
                          ),
                          Text('hyy')
                        ],
                      );
                    },

                  ),
                ),*/
