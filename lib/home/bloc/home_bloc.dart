import 'dart:async';
import 'dart:convert';

import 'package:apicall/cart/cart_item/cart_item.dart';
import 'package:apicall/home/models/product_model.dart';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<ProductDataModel> products = [];

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await fetchData();
    emit(HomeLoadedSuccessState(products: products));
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  Future<void> fetchData() async {
    print("Data fetching...");
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final data = json.decode(response.body);

    List<ProductDataModel> productModels = [];

    for (var item in data) {
      ProductDataModel productDataModel = ProductDataModel.fromJson(item);
      productModels.add(productDataModel);
    }

    products.addAll(productModels);
    print("data");
  }
}
