import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity {
  AdviceModel({required advice, required id}) : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      advice: json["advice"],
      id: json["id"],
    );
  }
}
