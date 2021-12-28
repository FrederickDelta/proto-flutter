import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _suggestions = <WordPair>[];
  final _favorite = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Name Generator"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: "Saved Suggestions",
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          /* 
            The expression i ~/ 2 divides i by 2 and returns an integer result. 
            For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2. 
            This calculates the actual number of word pairings in the ListView, 
            minus the divider widgets. 
          */
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            /* 
              If you’ve reached the end of the available word pairings, 
              then generate 10 more and add them to the suggestions list.
            */
            _suggestions.addAll(generateWordPairs().take(10));
          }
          /* 
            although after 0 the same index will appear twice,
            one of it will be offset by previous return (Divider)
          */
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final isFavorite = _favorite.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          isFavorite ? _favorite.remove(pair) : _favorite.add(pair);
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _favorite.map(
              (pair) => ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              )
          );

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
