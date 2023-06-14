import 'package:apicall/home/bloc/home_bloc.dart';
import 'package:apicall/home/models/product_model.dart';
import 'package:apicall/home/ui/product_details.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final HomeBloc homeBloc;

  const ProductTileWidget(
      {super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: NetworkImage(product.image))),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the next screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          product: product,
                        )),
              );
            },
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${product.price}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              OutlinedButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: product));
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          2.0), // Adjust the value to change the button's roundness
                    ),
                    backgroundColor: Colors.blue.shade600,
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  )),
              // Text(product.rating.count as String)
            ],
          ),
        ],
      ),
    );
  }
}
