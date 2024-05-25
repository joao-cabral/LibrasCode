import 'package:librascode/app/models/historic_model.dart';
import 'package:mobx/mobx.dart';

import '../../services/historic/historic_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final HistoricService _historicService;

  HomeControllerBase({required HistoricService historicService})
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
