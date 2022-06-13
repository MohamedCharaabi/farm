import 'dart:developer';

import 'package:farm_mobile/constants/constants.dart';
import 'package:farm_mobile/domain/models/ap/cow_model.dart';
import 'package:farm_mobile/domain/models/ap/lait_geter_model.dart';
import 'package:farm_mobile/domain/models/ap/lait_model.dart';
import 'package:farm_mobile/domain/models/ap/lait_stocker_model.dart';
import 'package:farm_mobile/domain/models/ap/lait_vendu_model.dart';
import 'package:farm_mobile/domain/network_api_service.dart';
import 'package:flutter/rendering.dart';

class LaitRepository {
  static LaitRepository? _instance;
  static NetworkApiService _networkApiService = NetworkApiService.getInstance();

  // singleton
  LaitRepository._internal();

  static LaitRepository getInstance() {
    _instance ??= LaitRepository._internal();

    return _instance!;
  }

  // apis

  Future<List<LaitModel>?> getAllLait(String cin) async {
    final response = await _networkApiService.getResponse("$BASEURL/laitvache");

    if (response == null) {
      return null;
    }

    final List<LaitModel> allLait = [];
    for (final lait in response.data) {
      allLait.add(LaitModel.fromJson(lait));
    }
    return allLait;
  }

  Future<List<LaitVenduModel>?> getLaitVendu(String cin) async {
    final response =
        await _networkApiService.getResponse("$BASEURL/laitvendu/$cin");

    if (response == null) {
      return null;
    }

    final List<LaitVenduModel> laitVendu = [];
    for (final lait in response.data) {
      laitVendu.add(LaitVenduModel.fromJson(lait));
    }
    return laitVendu;
  }

  Future<List<LaitGeterModel>?> getLaitGeter(String cin) async {
    final response =
        await _networkApiService.getResponse("$BASEURL/laitjete/$cin");

    if (response == null) {
      return null;
    }

    final List<LaitGeterModel> laitGeter = [];
    for (final lait in response.data) {
      laitGeter.add(LaitGeterModel.fromJson(lait));
    }
    return laitGeter;
  }

  Future<List<LaitStockerModel>?> getLaitStocker(String cin) async {
    final response =
        await _networkApiService.getResponse("$BASEURL/laitstocke/$cin");

    if (response == null) {
      return null;
    }

    final List<LaitStockerModel> laitStocker = [];
    for (final lait in response.data) {
      laitStocker.add(LaitStockerModel.fromJson(lait));
    }
    return laitStocker;
  }

// Ajout
  Future<void> ajoutLait(
      {required Map<String, dynamic> data,
      int? idTank,
      required int laitState}) async {
    final response = await _networkApiService.postResponse("$BASEURL/newlait",
        body: data,
        headers: {
          'Content-Type': 'application/json',
        },
        successMsg: 'Lait ajouté avec succès');

    if (response == null) {
      return null;
    }

    // stoking or throwing lait
    if (laitState == 0) {
      // response.data is a Map<String, dynamic> with saved lait id
      log('stoking lait =>       ${response.data}');

      final laitId = response.data['lait']['id'];
      final Map<String, dynamic> newData = {
        'id_lait': laitId,
        'id_tank': idTank,
        'qte': data['qte'],
      };

      final stokingResult = await ajoutLaitStocker(newData);

      log('lait stoker ajouté => $stokingResult');
    }
    if (laitState == 1) {
      // response.data is a Map<String, dynamic> with saved lait id

      final laitId = response.data['id'];
      final Map<String, dynamic> newData = {
        'id_lait': laitId,
        'id_tank': idTank,
        'qte': data['qte'],
      };

      await ajoutLaitJeter(newData);
    }

    return response.data;
  }

  Future ajoutLaitStocker(Map<String, dynamic> data) async {
    final response = await _networkApiService.postResponse("$BASEURL/newlaitst",
        body: data,
        headers: {
          'Content-Type': 'application/json',
        },
        successMsg: 'Lait stocker avec succès');

    if (response == null) {
      return null;
    }

    return response.data;
  }

  Future ajoutLaitJeter(Map<String, dynamic> data) async {
    final response = await _networkApiService.postResponse("$BASEURL/newlaitjt",
        body: data,
        headers: {
          'Content-Type': 'application/json',
        },
        successMsg: 'Lait jeter avec succès');

    if (response == null) {
      return null;
    }

    return response.data;
  }
}
