import 'package:dental_proj/Utils/extensions.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff003253),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Appointmet",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Summary",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            kVSpace24,
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(16),
                height: context.getHeight * 0.72,
                width: context.getWidth - 50,
                decoration: BoxDecoration(
                  color: const Color(0xfff2fbfd),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Doctoor",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 14),
                            ),
                            const Text(
                              "Ahmed Mohammed",
                              style: TextStyle(fontSize: 18),
                            ),
                            kVSpace8,
                            Text(
                              "Hospital",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 14),
                            ),
                            const Text(
                              "Care Clinic",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: const Color(0xfff2fbfd),
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.5,
                            ),
                          ),
                          child: const DateCard(),
                        ),
                      ],
                    ),
                    const DetailsContainer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Patient Case',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.3),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Normal Teeth',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Complaint',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.3),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: const SingleChildScrollView(
                            child: Text(
                              'Normal Teeth Normal Teeth Normal Teeth Normal Teeth  Normal Teeth Normal Teeth Normal Teeth Normal Teeth',
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Resault',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.3),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: const SingleChildScrollView(
                            child: Text(
                              'Normal Teeth Normal Teeth Normal Teeth Normal Teeth  Normal Teeth Normal Teeth Normal Teeth Normal TeethNormal Teeth Normal Teeth Normal Teeth Normal Teeth Normal Teeth Normal Teeth Normal Teeth Normal Teeth  ',
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------ the details Container ----------

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      width: context.getWidth - 50,
      decoration: BoxDecoration(
        color: const Color(0xff003253),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: const Center(
        child: Text(
          "Details",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ----- custome date card ------

class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 28,
          width: 90,
          decoration: const BoxDecoration(
            color: Color(0xff003253),
          ),
          child: const Text(
            'November',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          '28',
          style: TextStyle(
              fontSize: 28, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const Text(
          '2023',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
