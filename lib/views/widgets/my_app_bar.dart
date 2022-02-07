import 'dart:ui';
import 'package:dolarama_arg/providers/dollar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.cyan,
      title: const Text(
        "Dolarama",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Consumer<DollarProvider>(builder: (context, value, widget) {
            return IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30,
              ),
              onPressed: value.getListDollars,
            );
          }),
        ),
      ],
      elevation: 0,
      toolbarHeight: 70,
      expandedHeight: 160.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/dollar.jpg',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              child: Container(
                decoration: BoxDecoration(color: Colors.cyan.withAlpha(90)),
              ),
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            ),
            Image.asset(
              'assets/fry.png',
              scale: 7,
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}
