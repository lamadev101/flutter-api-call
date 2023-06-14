import 'dart:async';

import 'package:apicall/cart/cart_item/cart_item.dart';
import 'package:apicall/home/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFormCartEvent>(cartRemoveFormCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFormCartEvent(
      CartRemoveFormCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.product);
    emit(CartSuccessState(cartItems: cartItems));
  }
}
