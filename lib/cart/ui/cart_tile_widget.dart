import 'package:apicall/home/models/product_model.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';

class CartProductWidget extends StatelessWidget {
  final ProductDataModel product;
  final CartBloc cartBloc;

  const CartProductWidget(
      {super.key, required this.product, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.network(product.image),
        title: Text(product.title),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle),
          onPressed: () {
            // cartBloc.remove()
          },
        ),
      ),
    );
  }
}
