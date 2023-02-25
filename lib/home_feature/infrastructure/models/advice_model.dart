import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required advice, required id}) : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      advice: json["advice"],
      id: json["id"],
    );
  }

  @override
  List<Object?> get props => [advice, id];
}
