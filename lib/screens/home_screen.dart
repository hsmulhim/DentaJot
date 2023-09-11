import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_proj/components/appbar_home.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/data/offers.dart';
import 'package:dental_proj/models/offers_model.dart';
import 'package:dental_proj/models/patient_model.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get_storage/get_storage.dart';

import 'package:url_launcher/url_launcher.dart';
final box = GetStorage();

List<Offers> offersList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Offers offer;
  late final PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
 
 
  getUserFunction() async {
    final userData = await SupabaseService().fetchUserData();

    setState(() {});

    final patietobj = Patient.fromJson(userData);
    box.write("patient", patietobj);
  }
  @override
  void initState(){
   super.initState();

    for (var element in OffersData) {
      offersList.add(Offers.fromJson(element));
    }
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    // carasouelTmer = getTimer();

     getUserFunction();
  }

  @override
  void dispose() {
    pageController.dispose();
    offersList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2fbfd),
      appBar: HomeAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                pageNo = index;
                setState(() {});
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: GestureDetector(
                    onTap: () {
                      _launchUrl("${offersList[index].offerUrl}");
                    },

                    // ------- timer for the cards slide -------

                    // onPanDown: (d) {
                    //   carasouelTmer?.cancel();
                    //   carasouelTmer = null;
                    // },
                    // onPanCancel: () {
                    //   carasouelTmer = getTimer();
                    // },

                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 8, left: 8, top: 24, bottom: 12),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // -- to do add chashed image
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: offersList[index].offer ?? "",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )
                          //  Image.network(
                          //   offersList[index].offer ??
                          //       "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg",
                          //   fit: BoxFit.fill,
                          // ),
                          ),
                    ),
                  ),
                );
              },
              itemCount: offersList.length,
            ),
          ),
          kVSpace8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              offersList.length,
              (index) => GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: pageNo == index
                        ? Colors.indigoAccent
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
          kVSpace32,
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 7),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0XFFc6edfa),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        kVSpace8,
                        const Text(
                          "Click below to explore nearby clinics !!",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchUrl(
                                "https://www.google.com/maps/search/dental+clinic/");
                          },
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/maps.jpeg'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
