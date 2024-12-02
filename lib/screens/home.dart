import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedwise/Guestlist.dart';
import 'package:wedwise/screens/Love.dart';
import 'package:wedwise/vendorlist.dart';

import 'Giftscreen.dart';
import 'chatscreen.dart';
import 'eventscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<String> weddingIconTexts = [
    'Love ',     // For the Heart icon
    'Events',     // For the Calendar icon
    'Gift ',      // For the Gift icon
    'Chat ',    // For the Chat icon
  ];

  List<IconData> weddingIcons = [
    CupertinoIcons.heart,         // Love or romance
    CupertinoIcons.calendar,      // Scheduling or events
    CupertinoIcons.gift,          // Gift registry or budget
    CupertinoIcons.chat_bubble_2, // Messaging or communication
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<AssetImage> images = [
    const AssetImage('assets/images/img.png'),
    const AssetImage('assets/images/img2.png'),
    const AssetImage('assets/images/img1.png'),
  ];
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Close the drawer and perform an action
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Close the drawer and perform an action
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60,left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: SizedBox(
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
                  ),
                   Expanded(child: Row(
                    children:[ Expanded(child: Container()),
                      const Icon(Icons.monitor_heart_outlined,size: 30,color: Colors.red,)
                      ,const Text(
                      '  WedWise' ,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 25.0),
              child: const Text(
                'Plans',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'roboto',
                )
              ),
                ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                indicatorColor: Colors.redAccent,
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: const [
                Tab(icon: Icon(Icons.attach_money), text: "Budget"),
                Tab(icon: Icon(Icons.people), text: "Guest List"),
                Tab(icon: Icon(Icons.business), text: "Vendors"),
              ],

              ),
            ),
            SizedBox(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                  controller: tabController,
                  children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListView.builder(
                    itemCount: 3,scrollDirection: Axis.horizontal,
                    itemBuilder:
                    (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10,top: 15),
                      height: 200,width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: images[index],fit: BoxFit.cover
                          )
                      ),
                    );
                    },

                  ),
                ),
                 GuestListScreen(),
                VendorListScreen()
        
              ]
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
                  Text(
                      'Explore',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
        
                  )
                ],
              ),
            ),
            Container(
                height: 120,
                width: double.maxFinite,
              padding: const EdgeInsets.only(left: 20.0),
              child: ListView.builder(itemCount: weddingIcons.length,scrollDirection: Axis.horizontal,itemBuilder: (_, index) {

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, getPages()[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                              borderRadius: BorderRadius.circular(20),

                          ),
                          child: Icon(
                            weddingIcons[index],
                            size: 40,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(weddingIconTexts[index],style: const TextStyle(fontWeight: FontWeight.bold),)

                      ],
                    ),
                  ),
                );
              })
            )

          ],
        ),
      ),
    );
  }
}
List<MaterialPageRoute> getPages() {
  return [
    MaterialPageRoute(builder: (context) => const LoveScreen()),
    MaterialPageRoute(builder: (context) => const EventsScreen()), // Update to your EventsScreen
    MaterialPageRoute(builder: (context) => const GiftsScreen()),  // Update to your GiftsScreen
    MaterialPageRoute(builder: (context) => const ChatScreen()),   // Update to your ChatScreen
  ];
}