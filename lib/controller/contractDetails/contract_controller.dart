import 'dart:convert';
import 'package:cleaning_app/db/workers_db/workers-db.dart';
import 'package:cleaning_app/model/contract_model/contract_model.dart';
import 'package:cleaning_app/model/workers_model/workers_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/foundation.dart';

class ContractController extends ChangeNotifier {
  List<ContractModel> serviceNames = [];
  List<WorkersData> workersList = [];

  bool isAdded = false;

  void addWorker(WorkersData data) {
    workersList.add(data);
    isAdded = true;
    notifyListeners();
  }

  Future<void> loadContracts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString('contractDetails') ?? '[]';
    Iterable decoded = jsonDecode(jsonString);
    List<ContractModel> loadedContracts = List<ContractModel>.from(decoded.map(
        (contract) =>
            ContractModel.fromJson(contract as Map<String, dynamic>)));

    serviceNames = loadedContracts;
    notifyListeners();
  }

  Future<void> addContract(ContractModel contract) async {
    serviceNames.add(contract);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'contractDetails',
      json.encode(toJsonList()),
    );
  }

  List<Map<String, dynamic>> toJsonList() {
    return serviceNames.map((contract) => contract.toJson()).toList();
  }
}
