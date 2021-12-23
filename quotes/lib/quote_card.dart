import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  Quote quote;
  Function() delete;

  QuoteCard({ required this.quote, required this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  quote.text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  )
              ),
              const SizedBox(height: 4),
              Text(
                  quote.author,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  )
              ),
              TextButton.icon(
                onPressed: delete,
                icon: const Icon(Icons.delete),
                label: const Text('delete')
              )
            ],
          ),
        )
    );
  }
}