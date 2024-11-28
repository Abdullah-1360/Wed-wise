import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final List<AssetImage> images = [
    const AssetImage('assets/images/img.png'),
    const AssetImage('assets/images/img2.png'),
    const AssetImage('assets/images/img1.png'),
  ];
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);
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
                    ,Text(
                    '  WedWise' ,
                    style: GoogleFonts.abhayaLibre(
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
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Plans',
              style: GoogleFonts.allura(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              )
            ),
              ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                indicatorColor: Colors.redAccent,
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: const [
                Tab(icon: Icon(Icons.attach_money), text: "Budget"),
                Tab(icon: Icon(Icons.people), text: "Guest List"),
                Tab(icon: Icon(Icons.shopping_cart), text: "Vendors"),
              ],

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
                controller: _tabController,
                children: [
              ListView.builder(
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
              const Center(child: Text('G')),
              const Center(child: Text('V')),

            ]
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                    'Explore',
                  style: GoogleFonts.abrilFatface(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}