import 'package:gunaso/models/form_model.dart';
class GunasoState{
  late List<GunasoData> gunasoData;
  GunasoState({required this.gunasoData
  });
  GunasoState.init(): gunasoData = [];
  GunasoState copyWith({List<GunasoData>? gunasoData}){
    return GunasoState(gunasoData: gunasoData ?? this.gunasoData);
  }
}
