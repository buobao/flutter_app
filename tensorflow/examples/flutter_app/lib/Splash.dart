import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'Detail.dart';

void main() {
  var splash = new Splash();
  return runApp(splash);
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "BUOBAO",
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
      home:new RandomWord()
//      new Scaffold(
//        appBar: new AppBar(
//          title: new Center(child: new Text("Splash")),
//          backgroundColor: Color(0xFFFF0000),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.shopping_cart),
//              tooltip: 'Open shopping cart',
//              onPressed: () {
//                print('Shopping cart opened.');
//              },
//            ),],
//        ),
//        body: new Center(child: new RandomWord()),
//      ),
    );
  }
}

class RadomWordsState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 12.0);

  final _saved = new Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new IconButton(
        icon: alreadySaved ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        color: alreadySaved ? Color(0xFFFF0000):Color(0xFF666666),
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      ),
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute(builder: (context){
            return new DetailPage();
          })
        );
      },
    );
  }

  void _pressBtn() {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        final tiles = _saved.map(
              (pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided = ListTile
            .divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView(children: divided),
        );
      },
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        backgroundColor: Colors.black45,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pressBtn)
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RadomWordsState();
  }
}






















