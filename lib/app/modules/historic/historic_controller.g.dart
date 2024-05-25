// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoricController on HistoricControllerBase, Store {
  late final _$_historicAtom =
      Atom(name: 'HistoricControllerBase._historic', context: context);

  List<HistoricModel> get historic {
    _$_historicAtom.reportRead();
    return super._historic;
  }

  @override
  List<HistoricModel> get _historic => historic;

  @override
  set _historic(List<HistoricModel> value) {
    _$_historicAtom.reportWrite(value, super._historic, () {
      super._historic = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'HistoricControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('HistoricControllerBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
