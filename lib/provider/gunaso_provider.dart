import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gunaso/models/form_model.dart';
import 'package:gunaso/models/gunaso_initstate.dart';
import 'package:gunaso/services/dataservice.dart';


final gunasoProvider = StateNotifierProvider<GunasoProvider, GunasoState>((ref)=>GunasoProvider());

class GunasoProvider extends StateNotifier<GunasoState>{
  GunasoProvider(): super(GunasoState.init()){
    getData();
  }

  Future<void> getData() async{
    List<GunasoData> _gunasoData = [];
    _gunasoData = await DataService.getGunaso();
    //print(_gunasoData);
    state = state.copyWith(
      gunasoData:[...state.gunasoData,..._gunasoData]
    );
  }
}




