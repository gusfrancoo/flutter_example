
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_faculdade/app/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddProdutosController extends GetxController {
  // TextFields
  final TextEditingController nomeProd = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController urlImg = TextEditingController();


  final RxList<Product> products = <Product>[].obs;
  final box = GetStorage(); // Instância do GetStorage
  

  Future<void> addProducts() async {

    var prod = Product(
      name: nomeProd.text,
      price: double.tryParse(price.text) ?? 0.0,
      description: desc.text,
      imageUrl: urlImg.text,
    );

    products.add(prod);

    nomeProd.clear();
    price.clear();
    desc.clear();
    urlImg.clear();
    saveProducts();

  }

    void saveProducts() {
      final List<String> jsonProducts = products.map((prod) => jsonEncode(prod.toJson())).toList();
      print(jsonProducts);
      box.write('products', jsonProducts);
    }

}