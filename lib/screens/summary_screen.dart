import 'package:dental_proj/Utils/extensions.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/navigation.dart';
import 'package:dental_proj/screens/first_screen.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  final String doctorName;
  final String patientCases;
  final String appointmentDate;
  final String complaint;
  final String result;
  final String hospitalName;

  const SummaryScreen({
    Key? key,
    required this.doctorName,
    required this.patientCases,
    required this.appointmentDate,
    required this.complaint,
    required this.result,
    required this.hospitalName,
  }) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6fa2cd),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                IconButton(
                    onPressed: () {
                      const FirstScreen().push(context);
                    },
                    icon: const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                      size: 35,
                    ))
              ],
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Doctor Name",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 14),
                            ),
                            Text(
                              widget.doctorName,
                              style: const TextStyle(fontSize: 20),
                            ),
                            kVSpace8,
                            Text(
                              "Hospital",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 14),
                            ),
                            Text(
                              widget.hospitalName,
                              style: const TextStyle(fontSize: 20),
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
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.3),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.patientCases,
                              style: const TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis),
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
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.3),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.complaint,
                              style: const TextStyle(fontSize: 16),
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
                          child: SingleChildScrollView(
                            child: Text(
                              widget.result,
                              style: const TextStyle(fontSize: 16),
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
            'September',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          '12',
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
