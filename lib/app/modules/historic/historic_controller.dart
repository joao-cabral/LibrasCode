import 'package:mobx/mobx.dart';

import '../../models/historic_model.dart';
import '../../services/historic/historic_service.dart';

part 'historic_controller.g.dart';

class HistoricController = HistoricControllerBase with _$HistoricController;

abstract class HistoricControllerBase with Store {
  final HistoricService _historicService;

  HistoricControllerBase({required HistoricService historicService})
      : _historicService = historicService;

  @readonly
  List<HistoricModel> _historic = [];

  @observable
  bool loading = false;

  @action
  Future<void> getAll() async {
    try {
      loading = true;
      _historic = await _historicService.getAll();
      loading = false;
    } catch (error) {
      print(error);
    }
  }
}
