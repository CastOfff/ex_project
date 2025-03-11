import 'package:ex_project/page/product/product_best_seller_card.dart';
import 'package:flutter/material.dart';

import '../../data/model/product.dart';
import '../../data/repository/product_service.dart';

class ProductBestSellerPage extends StatefulWidget {
  const ProductBestSellerPage({super.key});

  @override
  State<ProductBestSellerPage> createState() => _ProductBestSellerPageState();
}

class _ProductBestSellerPageState extends State<ProductBestSellerPage> {
  final productService = ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6EFE8),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined, color: Colors.black,)
        ),
        actions: [
          IconButton(
              onPressed: () {
                Product product = Product(
                    createdAt: DateTime.now(),
                    reviewCount: 'ahfohsa',
                    name: 'Ok cuong',
                    description: 'test',
                    image: 'https://loremflickr.com/640/480/food');
                productService.createProduct(product);
              },
              icon: const Icon(Icons.add, color: Colors.black,)
          ),
          IconButton(
              onPressed: () {
                productService.updateProduct(
                    '22',
                    Product(
                        createdAt: DateTime.now(),
                        reviewCount: 'ahfohsa',
                        name: 'manh cuong',
                        description: 'test',
                        image: 'https://loremflickr.com/640/480/food'));
                setState(() {});
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
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
                      return ProductBestSeller(product: product[index]);
                    },
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
