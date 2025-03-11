import 'dart:convert';

import 'package:ex_project/data/model/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const domain = '67caf9da3395520e6af3dbc6.mockapi.io';
  static const header = {
    'Content-Type': 'application/json',
  };

  Future<List<Product>> getProductsFormSever() async {
    try {
      final response = await http.get(Uri.https(domain, 'product'), headers: header);

      if (response.statusCode == 200) {
        final List<dynamic> listJson = jsonDecode(response.body);
        return listJson.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Lỗi khi tải sản phẩm: ${response.statusCode}');
      }
    } catch (e) {
      print('Lỗi kết nối API: $e');
      return [];
    }
  }

  Future<Product> createProduct(Product product) async {
    final response = await http.post(
      Uri.https(domain, 'product'),
      headers: header,
      body: jsonEncode(product.toJson()),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Product.fromJson(data);
  }

  Future<Product> updateProduct(String id, Product product) async {
    final response = await http.put(
      Uri.https(domain, 'product/$id'),
      headers: header,
      body: jsonEncode(product.toJson()),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Product.fromJson(data);
  }
}