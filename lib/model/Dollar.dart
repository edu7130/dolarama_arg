import 'package:flutter/material.dart';

class Dollar {
  String _name = '';
  double _priceBuy = 0;
  double _priceSell = 0;
  double _variation = 0;

  String get name => _name;

  Dollar({
    required String name,
    required double priceBuy,
    required double priceSell,
    required double variation,
  }) {
    this.name = name;
    this.priceBuy = priceBuy;
    this.priceSell = priceSell;
    this.variation = variation;
  }

  Dollar.fromJSON(Map<String, dynamic> json) {
    name = json['nombre'] ?? '';
    priceBuy = _convert(json['compra']);
    priceSell = _convert(json['venta']);
    variation = _convert(json['variacion']);
  }

  set name(String name) {
    _name = name;
  }

  double get priceBuy => _priceBuy;

  set priceBuy(double priceBuy) {
    _priceBuy = priceBuy;
  }

  double get priceSell => _priceSell;

  set priceSell(double priceSell) {
    _priceSell = priceSell;
  }

  double get variation => _variation;

  set variation(double variation) {
    _variation = variation;
  }

  String getVariation() {
    String pref = "";
    String data = variation.toString();
    data = data.replaceAll(".", ",");

    if (variation > 0) {
      pref = "+ ";
    }

    return '$pref $data %';
  }

  double _convert(String? data) {

    try{
      double number = 0;
      data = data?.replaceAll(",", ".");
      return double.tryParse(data ?? '') ?? 0;
    }
    catch(_){
      return 0;
    }

  }
}