import 'package:apicall/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            child: const Text(
              // '${successState.products.length}',
              '10',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
        ]),
      ],
    );
    ;
  }
}
