import 'package:ex_project/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/happy_deal.dart';
import 'bloc/happy_deals_bloc.dart';
import 'happy_deals_card/happy_deal_card_1.dart';
import 'happy_deals_card/happy_deal_card_2.dart';
import 'large_discounts_page.dart';
import '../../router/router_name.dart';

class HappyDealsPage extends StatefulWidget {
  const HappyDealsPage({super.key});

  @override
  State<HappyDealsPage> createState() => _HappyDealsPageState();
}

class _HappyDealsPageState extends State<HappyDealsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HappyDealsBloc()..add(HappyDealsFetchAllDataEvent()),
      child: SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
                backgroundColor: backgroundColor,
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              }
                , icon: const Icon(Icons.keyboard_backspace, size: 30),
              )
            ),
            body: BlocBuilder<HappyDealsBloc, HappyDealsState>(
              builder: (context, state) {
                if (state is HappyDealsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is HappyDealsAllDataLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Happy Deals',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 14,),
                        Expanded(
                            child: ListView.builder(
                              itemCount: mockHappyDeals.length,
                              itemBuilder: (context, index) {
                                if (index % 2 == 0){
                                  return HappyDealCard2(
                                    happyDeal: mockHappyDeals[index],
                                  );
                                } else {
                                  return HappyDealCard1(
                                    happyDeal: mockHappyDeals[index],
                                  );
                                }
                              },
                            )
                        ),
                      ],
                    ),
                  );
                }
                if (state is HappyDealsAllDataError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              }
            ),
          )
      ),
    );
  }
}

Widget buildCard1(BuildContext context) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        //color: Color(0xff40f9ff),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Color(0xff1aab91),
            Color(0xff9af4e3),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
      ),
      child: Stack(
        children: [
          const ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: Image(image: AssetImage('assets/images/pngegg.png'), fit: BoxFit.cover),
          ),

          Positioned(
            left: 240,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('TRY NEW DISHER', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      maxRadius: 12,
                      minRadius: 9,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 9,),
                      ),
                    ),
                  ),
                  const Text('Explore uniques taste',),
                  const Text('For new eateries')
                ],
              ),
            ),
          ),
        ],
      )
  );
}

Widget buildCard2(BuildContext context) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Color(0xffdd4227),
            Color(0xfff3ab9a),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
              child: Image(image: AssetImage('assets/images/pngegg.png'), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('LAAAARDE DISCOUNTS', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    Text('Upto', style: TextStyle(color: Colors.white),),
                    SizedBox(width: 5,),
                    Text('20%', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Text('OFF', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  ],
                ),
                const Text('No Upper Limit!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                const SizedBox(height: 5,),
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  maxRadius: 12,
                  minRadius: 9,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouterName.largeDiscountsPage);
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 9,),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
  );
}