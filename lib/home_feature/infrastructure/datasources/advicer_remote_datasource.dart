import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/infrastructure/exeptions/exeptions.dart';
import 'package:bloc_app/home_feature/infrastructure/models/advice_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class AdvicerRemoteDataSource {
  ///requests a random advice from api
  ///throws server exeption if response is not 200
  Future<AdviceEntity> getRandomAdviceFromApi();
}

class AdvicerRemoteDataSourceImpl implements AdvicerRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.adviceslip.com/advice'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200) {
      throw ServerExeption();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody["slip"]);
    }
  }
}
