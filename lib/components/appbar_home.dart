import 'package:dental_proj/constants/spacings.dart';
import 'package:flutter/material.dart';

HomeAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: const Color(0xfff2fbfd),
    title: Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kVSpace32,
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg",
              height: 50,
              width: 50,
            ),
          ),
          kHSpace16,
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "name",
                style: TextStyle(color: Color(0xff003253), fontSize: 16),
              ),
              kVSpace8,
              Text("Description ..",
                  style: TextStyle(color: Color(0xff003253), fontSize: 16)),
            ],
          ),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.abc,
            color: Colors.grey,
            size: 50,
          ),
        ),
      ),
    ],
  );
}
