part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFormCartEvent extends CartEvent {
  final ProductDataModel product;
  CartRemoveFormCartEvent({
    required this.product,
  });
}
