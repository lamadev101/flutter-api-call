import 'package:apicall/cart/bloc/cart_bloc.dart';
import 'package:apicall/cart/ui/cart_tile_widget.dart';
import 'package:apicall/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart Items"),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final successState = state as CartSuccessState;
                int item = successState.cartItems.length;

                if (item > 1) {
                  return ListView.builder(
                      itemCount: successState.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartProductWidget(
                            product: successState.cartItems[index],
                            cartBloc: cartBloc);
                      });
                } else {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Your cart is empty"),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.red)),
                            onPressed: () {
                              homeBloc.add(HomeCartButtonNavigateEvent());
                            },
                            child: const Text(
                              "Go Back",
                              style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.red),
                            ))
                      ],
                    ),
                  ));
                }
              case CartErrorState:
                return const Scaffold(
                    body: Center(
                  child: Text('Error'),
                ));
              default:
                return const SizedBox();
            }
          },
        ));
  }
}
