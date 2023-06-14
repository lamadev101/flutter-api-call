import 'package:apicall/home/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final ProductDataModel product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.amber.shade600,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.product.image),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.product.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$ ${widget.product.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '\$ ${widget.product.price + 45}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.redAccent,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     const Icon(Icons.star_border_outlined),
              //     Text(widget.product.rating)
              //   ],
              // ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.yellow.shade700),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.red.shade700),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors
                    .grey.shade200, // Set the desired background color here
                child: Column(
                  children: [
                    Text(
                      "Product Details",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.description,
                      style:
                          TextStyle(color: Colors.grey.shade900, fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
