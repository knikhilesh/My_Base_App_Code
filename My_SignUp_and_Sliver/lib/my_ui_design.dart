import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyTabBarUIDemo1 extends StatelessWidget {
  const MyTabBarUIDemo1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Colors.white,

        textTheme: const TextTheme(

        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            /*bottom: const TabBar(
              indicatorWeight: 3.0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.orange,
              tabs: [
                Tab(child: Text("Profile"),),
                Tab(child: Text("Settings"),)
              ],
            ),*/
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.brown,
                size: 30,
              ), onPressed: () {  },
            ),
            title: Text('Your Profile', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),),
          ),
          body: TabBarView(
            children: [
              //Text("Profile"),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: ListView(
                  children: [
                    // first card
                    Card(
                      //color: Colors.white60,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.network('https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-2.jpg',
                                  height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text('Abigail Dawnson', textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    fontSize: 25,
                                    color: Colors.brown,
                                  ),
                                ),
                              )
                            ],
                          ),

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 20,right: 5),
                                child: Icon(Icons.chat_rounded, color: Colors.grey,),
                              ),
                                Container(
                                    padding: EdgeInsets.only(top: 10, bottom: 20),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: 'Goes by',
                                          style: TextStyle(
                                            color: Colors.brown,
                                            fontSize: 18,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' She / Her',
                                                style: TextStyle(
                                                    color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold),
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                    print("hello user");
                                                  })
                                          ]),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // second card
                    Card(
                          color: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 20),
                                    child: Text('Your Kids',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 20,bottom: 20),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 30, right: 10),
                                                child: Icon(Icons.face),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(bottom: 10),
                                                    child: Text('Justin',
                                                    style: TextStyle(fontSize: 18),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text('5 Years',
                                                    style: TextStyle(fontSize: 14)
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              /*Center(
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                              ),*/
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 20,bottom: 20),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 30, right: 10),
                                                child: Icon(Icons.face),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(bottom: 10),
                                                    child: Text('Angie',
                                                      style: TextStyle(fontSize: 18),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text('3 Years',
                                                        style: TextStyle(fontSize: 14)
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    ),

                    // third card
                    Card(
                      color: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 20, top: 20),
                              child: Text('Fun Fact', style: TextStyle(fontSize: 16),),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text('When me and Jess were little,'
                                  ' we built a house on a tree, and fell off'
                                  'after one minute.',
                              style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          /*Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text('Fun Fact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                                  child: Text('When me and Jess were little,'
                                      ' we built a house on a tree, and fell off'
                                      'after one minute.',
                                  style: TextStyle(fontSize: 16),
                                  ),
                              )
                            ],
                          )*/
                        ],
                      ),
                    ),

                    // forth card
                    Card(
                    color: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          // child: Icon(Icons.face),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Text('Group Gift',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Center(

                              ),
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      // child: Icon(Icons.face),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 70,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.deepPurple,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                            ),
                                            onPressed: (){

                                            },
                                            child: Text('EDIT', style: TextStyle(fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )

                      ],
                    ),
                    ),
                  ],
                ),
              ),

              Text("Settings")
            ],
          ),
        ),
      ),
    );
  }
}