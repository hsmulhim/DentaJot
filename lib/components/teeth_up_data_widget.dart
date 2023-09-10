import 'package:dental_proj/components/teeth_widget.dart';
import 'package:flutter/material.dart';

class TeethUpDataWidget extends StatelessWidget {
  const TeethUpDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 595,
                  height: 595,
                  child: Image.asset(
                    'images/AllGum-lastest.png',
                    width: 600,
                    height: 600,
                  ),
                ),
              ),
              const TeethWidget(
                topP: 258,
                liftP: 35,
                heightImg: 48,
                teethName: 18,
                toothId: 18,
                teethNumber: 1,
                teethimg: 'images/1-lastest.png',
              ),
              const TeethWidget(
                topP: 215,
                liftP: 35,
                heightImg: 48,
                teethName: 17,
                toothId: 17,
                teethNumber: 2,
                teethimg: 'images/2-lastest.png',
              ),
              const TeethWidget(
                topP: 175,
                liftP: 45,
                heightImg: 48,
                teethName: 16,
                toothId: 16,
                teethNumber: 3,
                teethimg: 'images/3-lastest.png',
              ),
              const TeethWidget(
                topP: 137,
                liftP: 55,
                heightImg: 48,
                teethName: 15,
                toothId: 15,
                teethNumber: 4,
                teethimg: 'images/4-lastest.png',
              ),
              const TeethWidget(
                topP: 100,
                liftP: 80,
                heightImg: 48,
                teethName: 14,
                toothId: 14,
                teethNumber: 5,
                teethimg: 'images/5-lastest.png',
              ),
              const TeethWidget(
                topP: 65,
                liftP: 105,
                heightImg: 48,
                teethName: 13,
                toothId: 13,
                teethNumber: 6,
                teethimg: 'images/6-lastest.png',
              ),
              const TeethWidget(
                topP: 35,
                liftP: 130,
                heightImg: 48,
                teethName: 12,
                toothId: 12,
                teethNumber: 7,
                teethimg: 'images/7-lastest.png',
              ),
              const TeethWidget(
                topP: 25,
                liftP: 173,
                heightImg: 48,
                teethName: 11,
                toothId: 11,
                teethNumber: 8,
                teethimg: 'images/8-lastest.png',
              ),
              const TeethWidget(
                topP: 30,
                liftP: 220,
                heightImg: 48,
                teethName: 21,
                toothId: 21,
                teethNumber: 9,
                teethimg: 'images/9-lastest.png',
              ),
              const TeethWidget(
                topP: 42,
                liftP: 260,
                heightImg: 48,
                teethName: 22,
                toothId: 22,
                teethNumber: 10,
                teethimg: 'images/10-lastest.png',
              ),
              const TeethWidget(
                topP: 80,
                liftP: 275,
                heightImg: 48,
                teethName: 23,
                toothId: 23,
                teethNumber: 11,
                teethimg: 'images/11-lastest.png',
              ),
              const TeethWidget(
                topP: 112,
                liftP: 295,
                heightImg: 48,
                teethName: 24,
                toothId: 24,
                teethNumber: 12,
                teethimg: 'images/12-lastest.png',
              ),
              const TeethWidget(
                topP: 150,
                liftP: 310,
                heightImg: 48,
                teethName: 25,
                toothId: 25,
                teethNumber: 13,
                teethimg: 'images/13-lastest.png',
              ),
              const TeethWidget(
                topP: 187,
                liftP: 320,
                heightImg: 48,
                teethName: 26,
                toothId: 26,
                teethNumber: 14,
                teethimg: 'images/14-lastest.png',
              ),
              const TeethWidget(
                topP: 225,
                liftP: 325,
                heightImg: 48,
                teethName: 27,
                toothId: 27,
                teethNumber: 15,
                teethimg: 'images/15-lastest.png',
              ),
              const TeethWidget(
                topP: 267,
                liftP: 325,
                heightImg: 48,
                teethName: 28,
                toothId: 28,
                teethNumber: 16,
                teethimg: 'images/16-lastest.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
