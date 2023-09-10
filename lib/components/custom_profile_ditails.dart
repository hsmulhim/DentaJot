import 'package:dental_proj/constants/spacings.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: 83,
                          height: 92,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                          child: const Center(
                            child: Text(
                              'My Reports',
                              textAlign: TextAlign.center, 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 16, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      kHSpace16,
                       InkWell(
                        child: Container(
                          width: 83,
                          height: 92,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                          child: const Center(
                            child: Text(
                              'My \nX ray',
                              textAlign: TextAlign.center, 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 16, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      kHSpace16,
                       InkWell(
                        child: Container(
                          width: 83,
                          height: 92,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                          child: const Center(
                            child: Text(
                              'My Photos',
                              textAlign: TextAlign.center, 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 16, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ) ;
  }
}