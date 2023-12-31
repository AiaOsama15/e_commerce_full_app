import 'dart:io';

import 'package:e_commerce_app/NetworkService/dio_helper.dart';
import 'package:e_commerce_app/shoping_featcher/domain/cubit/catogery/catogeryStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCatogeryCubit extends Cubit<GetCatogeryState> {
  GetCatogeryCubit() : super(InitStateA());

  static GetCatogeryCubit get(context) => BlocProvider.of(context);
  // static CatogeryDataModel? objectOfModel;

  Future getCatogeryData({required int id}) async {
    try {
      emit(LoadingCatogeryState());

      final objectOfModel = await DioEcommerce.getCatogeryData(id: id);
      if (objectOfModel != null) {
        emit(
          GetCatogerySussessState(objectOfModel),
        );
      }
      // ignore: unused_catch_clause
    } on SocketException catch (e) {
      emit(GetCatogeryfailerNetworkState());
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(GetCatogeryfailerState());
    }
  }
}
