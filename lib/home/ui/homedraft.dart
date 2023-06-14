// import 'dart:convert';
// import 'package:apicall/home/bloc/home_bloc.dart';
// import 'package:apicall/home/models/product_model.dart';
// import 'package:apicall/home/ui/product_tile_widget.dart';
// // import 'package:apicall/home/userdetails.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<ProductDataModel> products = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber.shade600,
//         title: const Text("Ecommerce App"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 // homeBloc.add(HomeWishlistButtonNavigateEvent());
//               },
//               icon: const Icon(Icons.favorite_border)),
//           IconButton(
//               onPressed: () {
//                 // homeBloc.add(HomeCartButtonNavigateEvent());
//               },
//               icon: const Icon(Icons.shopping_bag_outlined)),
//         ],
//       ),
//       body: Container(
//         child: ListView.builder(
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             return ProductTileWidget(
//               // homeBloc: homeBloc,
//               product: products[index],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> fetchData() async {
//     print("Data fetching...");
//     final response =
//         await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     final data = json.decode(response.body);

//     List<ProductDataModel> productModels = [];

//     for (var item in data) {
//       ProductDataModel productDataModel = ProductDataModel.fromJson(item);
//       productModels.add(productDataModel);
//     }

//     setState(() {
//       products.addAll(productModels);
//     });
//   }
// }
