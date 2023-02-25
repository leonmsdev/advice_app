import 'dart:convert';

import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/infrastructure/models/advice_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final testAdviceModel = AdviceModel(advice: "test", id: 1);

  test('Model should be a subclass of AdviceEntity', () {
    //assert
    expect(testAdviceModel, isA<AdviceEntity>());
  });

  group('fromJson facoty', () {
    test('Should return a valid model if json advice is correct', () {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('advice.json'));
      //act
      final result = AdviceModel.fromJson(jsonMap);

      //assert
      expect(result, testAdviceModel);
    });
  });
}
