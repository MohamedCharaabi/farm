import 'package:farm_mobile/constants/constants.dart';
import 'package:farm_mobile/domain/models/ap/cow_model.dart';
import 'package:farm_mobile/domain/network_api_service.dart';
import 'package:flutter/rendering.dart';

class VacheRepository {
  static VacheRepository? _instance;
  static NetworkApiService _networkApiService = NetworkApiService.getInstance();

  // singleton
  VacheRepository._internal();

  static VacheRepository getInstance() {
    _instance ??= VacheRepository._internal();

    return _instance!;
  }

  // apis

  Future<List<CowModel>?> getCowsByCin(String cin) async {
    final response =
        await _networkApiService.getResponse("$BASEURL/vache/$cin");

    if (response == null) {
      return null;
    }

    final List<CowModel> cows = [];
    for (final cow in response.data) {
      cows.add(CowModel.fromJson(cow));
    }
    return cows;
  }

  Future<CowModel?> getCowById(int id) async {
    final response =
        await _networkApiService.getResponse("$BASEURL/showvache/$id");

    if (response == null) {
      return null;
    }

    final CowModel cows = CowModel.fromJson(response.data);
    return cows;
  }

  Future ajoutVache(Map<String, dynamic> data) async {
    final response = await _networkApiService.postResponse("$BASEURL/newvache",
        body: data, headers: {'Content-Type': 'application/json'});

    debugPrint("response: ${response}");

    // if (response == null) {
    //   return null;
    // }

    // final CowModel cows = CowModel.fromJson(response.data);
    // return cows;
  }
}
