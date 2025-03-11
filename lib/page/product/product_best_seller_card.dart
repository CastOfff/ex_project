import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class ProductBestSeller extends StatefulWidget {
  final Product product;
  const ProductBestSeller({super.key, required this.product});

  @override
  State<ProductBestSeller> createState() => _ProductBestSellerState();
}

class _ProductBestSellerState extends State<ProductBestSeller> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.only(left: 13, right: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              width: 104,
              height: 94,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), // Bo tròn góc (tùy chọn)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // bo tròn góc cho ảnh bên trong container.
                child: Image(
                  image: NetworkImage(widget.product.image!),
                  width: 104,
                  height: 94,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(widget.product.description!,
                            style: TextStyle(fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.product.reviewCount!,
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFAD3F32),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: const Size(91, 26),
                          ),
                          child: Text('Reserve', style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),)
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

