import 'package:e_commerce_app/cartFeatcher/domain/cubit/cartStates.dart';

import 'package:e_commerce_app/model/cart_data_model.dart';
import 'package:e_commerce_app/NetworkService/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());
  static CartCubit get(context) => BlocProvider.of(context);
  late CartModel cartModel;
  postDataToCart(int productId) async {
    emit(CartLoadingState());
    cartModel = await DioEcommerce.postDataToCart(productId);
    emit(CartGetDataSucessState());
    print('cartItems is : ${cartModel.data.cartItems}');
  }
}
