import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import 'package:pataya_ending_card/app/constants/colors.dart';

import 'package:flutter/material.dart';

Widget appIcon() {
  return Row(
    children: [
      const Icon(
        Icons.qr_code_2_rounded,
        size: 30,
      ),
      const SizedBox(
        width: 10,
      ),
      const Text("DIGICARD"),
      hSpaceSmall,
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Colors.yellow.shade700,
                  Colors.orange.shade900,
                  Colors.orange.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Center(
              child: Text(
                "FREE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
    ],
  );
}
