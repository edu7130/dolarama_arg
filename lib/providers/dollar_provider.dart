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

  set _setLoading(bool loading){
    _loading = loading;
    notifyListeners();
  }

  getListDollars() async {
    _setLoading = true;
    _listDollar = await DollarApi.getDollars();
    _setLoading = false;
  }
}
