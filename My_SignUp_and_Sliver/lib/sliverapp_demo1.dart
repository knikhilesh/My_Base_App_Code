import 'package:flutter/material.dart';

class SliverAppBarDemo2 extends StatelessWidget {
  const SliverAppBarDemo2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySliverAppHomePage(),
    );
  }
}

class MySliverAppHomePage extends StatefulWidget {
  const MySliverAppHomePage({Key key}) : super(key: key);

  @override
  _MySliverAppHomePageState createState() => _MySliverAppHomePageState();
}

class _MySliverAppHomePageState extends State<MySliverAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.brown,
                size: 30,
              ), onPressed: () {  },
            ),
            title: Text('Your Profile', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),),
          ),
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: MySliverAppBar(expandedHeight: 200),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, index) => ListTile(
                    title: Text("Index: $index"),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        /*Image.network(
          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          fit: BoxFit.cover,
        ),*/
        Container(
          color: Colors.grey,
          height: 300,
          width: 300,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

