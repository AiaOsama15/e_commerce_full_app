import 'package:e_commerce_app/cubit/counter_cart/states_counter_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCartCubit extends Cubit<CounterCartStates> {
  CounterCartCubit() : super(CounterCartInitStateA());

  int counter = 1;
  static CounterCartCubit get(context) => BlocProvider.of(context);
  counterPlus(int value) {
    counter += value;
    emit(CounterPlusState());
  }

  counterMinus(int value) {
    if (counter > 1) {
      counter -= value;
      emit(CounterMinusState());
    }
  }
}
