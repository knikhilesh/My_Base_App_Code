import 'package:flutter/material.dart';

class SliverAppDemo6 extends StatelessWidget {
  const SliverAppDemo6({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MySliverAppHomePage(),
      ),
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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: LayoutBuilder(
                builder: (context, index){
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        ClipOval(
                          child: Image.network('https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-2.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('guest'),
                      ],
                    ),
                    background: Image.network('https://www.olympus-imaging.co.in/content/000101300.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              )
              ,
            ),
            SliverToBoxAdapter(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index) => Card(
                  child: ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text('title'),
                    subtitle: Text('subtitle'),

                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}

