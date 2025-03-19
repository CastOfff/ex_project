
import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/product.dart';

class BestSellerItem extends StatefulWidget {
  final Product product;
  const BestSellerItem({super.key, required this.product});

  @override
  State<BestSellerItem> createState() => _BestSellerItemState();
}

class _BestSellerItemState extends State<BestSellerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 222,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: NetworkImage(widget.product.image!),
            width: 104,
            height: 104,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.product.name!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, fill: 0, color: Colors.black87, size: 10,),
              Text('An BBQ Su Van Hanh', style: TextStyle(fontSize: 10),)
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterName.reservationPage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAD3F32),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(129, 35),
              ),
              child: const Text('Reserve', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),)
          )
        ],
      ),
    );
  }
}
