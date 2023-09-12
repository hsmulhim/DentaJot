import 'package:dental_proj/constants/spacings.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          InkWell(
            child: SizedBox(
              width: 110,
              height: 150,
              child: Column(
                children: [
                  Image.network(
                    'https://www12.0zz0.com/2023/09/11/15/524221666.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'Reports',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          kHSpace8,
          InkWell(
            child: SizedBox(
              width: 110,
              height: 150,
              child: Column(
                children: [
                  Image.network(
                    'https://www12.0zz0.com/2023/09/11/15/614041657.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'X-ray',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          kHSpace8,
          InkWell(
            child: SizedBox(
              width: 110,
              height: 150,
              child: Column(
                children: [
                  Image.network(
                    'https://www12.0zz0.com/2023/09/11/15/466980046.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'Photos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
