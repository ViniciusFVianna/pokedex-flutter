import 'package:flutter/material.dart';

class PokemonItemList extends StatelessWidget {
  final String name;
  final String url;
  const PokemonItemList({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 0.5),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 60,
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      );
}
