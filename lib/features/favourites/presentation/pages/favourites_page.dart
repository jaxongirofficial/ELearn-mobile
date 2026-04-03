import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Favourite screen',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
