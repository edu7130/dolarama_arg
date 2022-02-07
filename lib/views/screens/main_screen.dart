import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dolarama_arg/model/Dollar.dart';

import 'package:dolarama_arg/views/widgets/card_dollar.dart';
import 'package:dolarama_arg/views/widgets/error_message.dart';
import 'package:dolarama_arg/views/widgets/my_app_bar.dart';

import 'package:dolarama_arg/providers/dollar_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, bool) {
          return [
            const MyAppBar(),
          ];
        },
        body: Consumer<DollarProvider>(
          builder: (context, value, _){
            final List<Dollar> lDollar = value.listDollar;

            if (value.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (lDollar.isNotEmpty) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: lDollar.length,
                itemBuilder: (context, i) {
                  return CardDollar(lDollar[i]);
                },
              );
            }
            return const Center(child: ErrorMessage());
          },
        ),
      ),
    );
  }
}