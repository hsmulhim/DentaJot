import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dental_proj/components/appbar_home.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/data/offers.dart';
import 'package:dental_proj/models/offers_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

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
  // final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    int length = offersList.length;

    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == length) {
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

  //// url launcher function
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    for (var element in OffersData) {
      offersList.add(Offers.fromJson(element));
    }

    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();

    super.initState();
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
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: offersList[index].offer ?? "",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
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
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 7),
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
                        // kVSpace8,
                        GestureDetector(
                          onTap: () {
                            _launchUrl(
                                "https://www.google.com/maps/search/dental+clinic/");
                          },
                          child: Container(
                            height: 113,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/maps2.gif'),
                              ),
                            ),
                          ),
                        ),

                        const Text(
                          "Click to explore nearby clinics !!",
                          style: TextStyle(fontSize: 16),
                        ),
                        kVSpace8,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          kVSpace8,
          const LabelWidget(),
          kVSpace8,
          const AIQuestionWidget(),
        ],
      ),
    );
  }
}

//--------- this is the ai card

class AIQuestionWidget extends StatelessWidget {
  const AIQuestionWidget({
    super.key,
  });

  // final String question;
  // final Icon icon;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (contex, int, index) {
        return AnimatedContainer(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: index.isEven
                    ? [
                        const Color(0xfff97b65),
                        const Color.fromARGB(255, 252, 190, 179),
                      ]
                    : [
                        const Color(0xff2b59b5),
                        const Color.fromARGB(255, 130, 149, 186),
                      ],
              ),
              borderRadius: BorderRadius.circular(20)),
          duration: const Duration(milliseconds: 500),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "this is a question that needs an answer?",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    )),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 190.0,

        // autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.6,
      ),
    );
  }
}

//-------------- the label --------

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Frequently Asked",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text("View All",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xff076fe0),
            )),
      ],
    );
  }
}
