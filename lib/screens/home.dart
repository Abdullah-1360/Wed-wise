import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60,left: 20),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    color: Colors.grey[200],
                    elevation: 0,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.menu_rounded,
                      size: 30,
                      color:Colors.black12,
                    ),
                  ),
                ),
                 Expanded(child: Row(
                  children:[ Expanded(child: Container()),
                    const Icon(Icons.monitor_heart_outlined,size: 30,color: Colors.red,)
                    ,const Text(
                    '  WedWise' ,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),Expanded(child: Container()),]
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,

                    child: Card(
                      color: Colors.red[100],
                      elevation: 1,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        CupertinoIcons.settings,
                        size: 30,
                        color: Color(0xff9e2532),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20.0),
            child: const Text(
              'Plans',
              style: TextStyle(

                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
              ),
          const SizedBox(height: 15.0),
          Container(
            child: const TabBar(
              isScrollable: true,
              tabs: [
              Tab(icon: Icon(Icons.home), text: "Dashboard"),
              Tab(icon: Icon(Icons.checklist), text: "Checklist"),
              Tab(icon: Icon(Icons.money), text: "Budget"),
              Tab(icon: Icon(Icons.people), text: "Guest List"),
              Tab(icon: Icon(Icons.shopping_cart), text: "Vendors"),
              Tab(icon: Icon(Icons.photo_album), text: "Gallery"),
            ],

            ),
          )
        ],
      ),
    );
  }
}
