import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class MenuProductCard extends StatefulWidget {
  final Product product;
  const MenuProductCard({super.key, required this.product});

  @override
  State<MenuProductCard> createState() => _MenuProductCardState();
}

class _MenuProductCardState extends State<MenuProductCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 98,
        padding: const EdgeInsets.only(left: 13, right: 13),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 76,
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
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(widget.product.description!,
                            style: const TextStyle(fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '${widget.product.price!}0 VND',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
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
