import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterLayoutApp());
}

class FlutterLayoutApp extends StatelessWidget {
  const FlutterLayoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            _buildTitleSection(),
            _buildButtonSection(context),
            _buildTextSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text('Oeschinen Lake Campground',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const FavoriteWidget(),
        ],
      ),
    );

    return titleSection;
  }

  Widget _buildButtonSection(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(color, Icons.call, 'CALL'),
        _buildButton(color, Icons.near_me, 'ROUTE'),
        _buildButton(color, Icons.share, 'SHARE'),
      ],
    );

    return buttonSection;
  }

  Widget _buildButton(Color color, IconData icon, String label) {
    Widget button = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );

    return button;
  }

  Widget _buildTextSection() {
    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: const Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        ));

    return textSection;
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 42;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            _isFavorite ? Icons.star : Icons.star_border,
            color: Colors.red[500],
          ),
          onPressed: () {
            setState(() {
              _isFavorite = ! _isFavorite;
              _isFavorite ? _favoriteCount++ : _favoriteCount--;
            });
          },
        ),
        Text('$_favoriteCount'),
      ],
    );
  }
}
