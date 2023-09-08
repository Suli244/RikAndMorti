import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rikmorti/data/models/character_Model.dart';

class CharsDetailsPage extends StatelessWidget {
  const CharsDetailsPage({
    super.key,
    required this.data,
  });
  final MyCharacters data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                data.image ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
                height: 226,
              ),
              Container(
                width: double.infinity,
                height: 230,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [
                      Color.fromARGB(255, 26, 25, 25),
                      Color(0x000A1E2D),
                      Color(0x000A1E2D),
                    ],
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 45,
                  left: 10,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
