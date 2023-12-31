import 'package:dio/dio.dart';

import 'package:e_commerce_app/data/home_repo.dart';
import 'package:e_commerce_app/home_featcher/domain/cubit/banner/bannerStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetHomeCubitBanner extends Cubit<GetHomeBannerStates> {
  GetHomeCubitBanner() : super(InitState());
  List? banner;
  static GetHomeCubitBanner get(context) => BlocProvider.of(context);
  Future getHomeData() async {
    emit(LoadingState());
    Response? response = await HomeRepo.getHomeData();
    // print('cubit response $response');
    if (response?.data['status'] == true) {
      // print('cubit response status : ${response.data['status']}');
      // print('cubit response.data : ${response.data}');
      emit(HomeSucessState());
      banner = response?.data['data']['banners'];
      // print('the cubit banners is : $banner');
      return response;
    }
    if (response?.data['status'] == false) {
      emit(HomeFailerState());
      return null;
    }
  }
}
