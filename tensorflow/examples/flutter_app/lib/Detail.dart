import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  Column createButton(IconData icon, String title){
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon,color: Colors.blue,),
        new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              title,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Container(padding: const EdgeInsets.all(32),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text("Oeschinen Lake Campground",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
              ),
              new Text("Kandersteg, Switzerland", style: new TextStyle(color: Colors.grey[500],)),
            ],)),
          new Icon(Icons.star, color: Colors.red[500],),
          new Text('41'),
        ],
      ),);

    Widget buttonLine = new Container(
      child: new Row(children: <Widget>[
        createButton(Icons.call, "CALL"),
        createButton(Icons.near_me, "ROUTES"),
        createButton(Icons.share, "SHARE"),
      ],
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,),);

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
      appBar:
        new AppBar(title: new Text("detail page",),),
      body: new ListView(children: <Widget>[
        new Image.asset("images/ic_second_list_ad.png",
            width: 600,
            height: 180,
        fit: BoxFit.fill,),
        titleSection,
        buttonLine,
        textSection
      ],),
      );
  }
}