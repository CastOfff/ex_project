
import 'package:ex_project/page/reservation/menu_product_card.dart';
import 'package:flutter/material.dart';

import '../../data/model/product.dart';
import '../../data/repository/product_service.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = ProductService();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<Product>>(
            future: productService.getProductsFormSever(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Lỗi: ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("Không có sản phẩm nào!");
              }
              final product = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return MenuProductCard(product: product[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
