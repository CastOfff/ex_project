
import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

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
          Image(image: AssetImage('assets/images/beef ribs.png')),
          Text('Beef Ribs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, fill: 0, color: Colors.black87, size: 10,),
              Text('An BBQ Su Van Hanh', style: TextStyle(fontSize: 10),)
            ],
          ),
          ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAD3F32),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(129, 35),
              ),
              child: Text('Reserve', style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),)
          )
        ],
      ),
    );
  }
}
