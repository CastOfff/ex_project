
import 'package:flutter/material.dart';

import '../../../../../data/model/company_info_model.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(companyInfoMockData.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 15)),
          Text(companyInfoMockData.address,
              style: const TextStyle(fontSize: 15)),
          Text(companyInfoMockData.gpk,
              style: const TextStyle(fontSize: 15)),
          Text(companyInfoMockData.phoneNumber,
              style: const TextStyle(fontSize: 15)),
          Text(companyInfoMockData.email,
              style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
