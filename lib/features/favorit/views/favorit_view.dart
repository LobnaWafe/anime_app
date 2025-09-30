import 'package:anime_app/features/favorit/widgets/favorit_view_body.dart';
import 'package:flutter/material.dart';

class FavoritView extends StatelessWidget {
  const FavoritView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: FavoritViewBody()),);
  }
}