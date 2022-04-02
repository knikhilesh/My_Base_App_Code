import 'package:flutter/material.dart';

class MySliverDemoExample1 extends StatelessWidget {
  const MySliverDemoExample1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySliverDemoHome1(),
    );
  }
}

class MySliverDemoHome1 extends StatefulWidget {
  const MySliverDemoHome1({Key key}) : super(key: key);

  @override
  _MySliverDemoHome1State createState() => _MySliverDemoHome1State();
}

class _MySliverDemoHome1State extends State<MySliverDemoHome1> {

  ScrollController _scrollController;
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            title: Text("Your Profile"),
          ),
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                  title: TabBar(
                    tabs: [
                      Tab(child: Text("Profile"),),
                      Tab(child: Text("Settings"),)
                    ],
                  ),
                  expandedHeight: 250,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {

                        top = constraints.biggest.height;
                        return FlexibleSpaceBar(
                          centerTitle: true,
                          title: AnimatedOpacity(
                            duration: Duration(
                                milliseconds: 100
                            ),
                            opacity: top <= 100 ? 1.0 : 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: CircleAvatar(
                                  child: Image.network("https://img.freepik.com/free-photo/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-him-smiling_343059-4560.jpg",
                                  fit: BoxFit.cover,
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          background: Image.network('https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    )
                  ),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            leading: Icon(Icons.arrow_back),
                            title: Text('Title'),
                            subtitle: Text('SubTitle'),
                            trailing: Icon(Icons.delete),
                          ),
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

