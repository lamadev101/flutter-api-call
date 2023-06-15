import 'package:apicall/home/models/hive_product_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoreDataLocally {
  static Future<void> storeApiResToLocalDb() async {
    final appDocumentDirectory = await path.getApplicationDocumentsDirectory();

    await Hive.initFlutter(appDocumentDirectory.path);
    print(appDocumentDirectory.path);

    Hive.registerAdapter(LocalStoreProductAdapter());

    var store = await Hive.openBox<LocalStoreProduct>('myStore');

    print("Data fetching from Hive...");

    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final data = json.decode(response.body);

    await store.clear();

    for (var item in data) {
      await store.add(LocalStoreProduct.fromJson(item));
    }

    print("Fetch Data");
  }
}
