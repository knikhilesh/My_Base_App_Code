import 'package:flutter/material.dart';

class SliverAppDemo1 extends StatelessWidget {
  const SliverAppDemo1({Key key}) : super(key: key);

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    leading: Icon(Icons.arrow_back),
                    title: Text('Your Profile'),
                    expandedHeight: 250,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints){

                        top = constraints.biggest.height;

                        return FlexibleSpaceBar(
                          centerTitle: true,
                          title: AnimatedOpacity(
                            duration: Duration(
                              milliseconds: 300
                            ),
                            opacity: top <= 130 ? 1.0 : 0.0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(

                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text('Guest'),
                              ],
                            ),
                          ),
                          background: Image.network('https://previews.123rf.com/images/kudoh/kudoh1805/kudoh180500050/101034526-raindrop-background.jpg',
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
              _buildFab(),
            ],
          ),
        )
    );
  }
  Widget _buildFab(){

    final double defaultMarigin = 250;
    final double defaultStart = 230;
    final double defaultEnd = defaultStart / 2;

    double top = defaultMarigin;
    double scale = 1.0;

    if(_scrollController.hasClients){
      double offset = _scrollController.offset;
      top -= offset;

      if(offset < defaultMarigin - defaultStart){
        scale = 1.0;
      }else if(offset < defaultStart - defaultEnd){
        scale = (defaultMarigin - defaultEnd -offset) / defaultEnd;
      }else {
         scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale),
        child: FloatingActionButton(
            onPressed: (){}
        ),
      ),
    );
  }
}
