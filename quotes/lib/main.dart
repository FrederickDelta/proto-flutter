import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'An interoffice communication too often written more for the benefit of the person who sends it.'),
    Quote(author: 'Elon Musk', text: 'He only knew his iron spine held up the sky'),
    Quote(author: 'Bill Gates', text: 'Boys, you have ALL been selected to LEAVE the PLANET in 15 minutes!!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Awesome Title'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () {
            setState(
              () {
                quotes.remove(quote);
              }
            );
          }
        )).toList(),
      )
    );
  }
}


