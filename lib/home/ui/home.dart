import 'package:apicall/cart/bloc/cart_bloc.dart';
import 'package:apicall/cart/ui/cart.dart';
import 'package:apicall/home/ui/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apicall/home/bloc/home_bloc.dart';
import 'package:apicall/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item Carted Successfully")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            // final item = state as CartSuccessState;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange.shade800,
                title: const Text("Ecommerce App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  Stack(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${successState.products.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag_outlined)),
                  ]),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        product: successState.products[index],
                        homeBloc: homeBloc);
                  }),
            );

          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Error')));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
