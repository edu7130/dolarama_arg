import 'package:flutter/material.dart';

import 'package:dolarama_arg/model/Dollar.dart';
import 'package:dolarama_arg/views/util/card_clipper.dart';

class CardDollar extends StatelessWidget {

  final Dollar dollar;


  CardDollar(this.dollar);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(10),
      elevation: 8,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 130,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: ClipPath(
                clipper: MyClipperCard(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 35, bottom: 5),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            dollar.getVariation(),
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            dollar.name,
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.only(right: 25, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Detail(
                      title: "Venta:",
                      value: dollar.priceSell,
                    ),
                    Detail(
                      title: "Compra:",
                      value: dollar.priceBuy,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  TextStyle style = TextStyle(fontSize: 17, letterSpacing: .5, color: Colors.grey.shade700);

  final String title;
  final double value;

  Detail({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          child: Text(
            title,
            style: style.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        FittedBox(
          child: Text(
            "\$ $value",
            style: style.copyWith(fontSize: 26, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }
}
