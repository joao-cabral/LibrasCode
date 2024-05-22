import 'package:flutter/material.dart';

import '../../models/historic_model.dart';
import '../../services/historic/historic_service.dart';

class HistoricController {
  final HistoricService _historicService;

  HistoricController({required HistoricService historicService})
      : _historicService = historicService;

  ValueNotifier<List<HistoricModel>> historic = ValueNotifier([]);

  ValueNotifier<bool> loading = ValueNotifier(false);

  Future<void> getAll() async {
    try {
      loading.value = true;
      historic.value = await _historicService.getAll();
      loading.value = false;
    } catch (error) {
      print(error);
    }
  }
}
