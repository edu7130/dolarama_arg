import 'package:flutter/material.dart';

import 'package:dolarama_arg/api/dollar_api.dart';
import 'package:dolarama_arg/model/Dollar.dart';

class DollarProvider extends ChangeNotifier {
  DollarProvider() {
    getListDollars();
  }

  List<Dollar> _listDollar = [];

  bool _loading = false;

  get listDollar => _listDollar;

  get loading => _loading;

  getListDollars() async {
    _loading = true;
    notifyListeners();
    _listDollar = await DollarApi.getDollars();
    _loading = false;
    notifyListeners();
  }
}
