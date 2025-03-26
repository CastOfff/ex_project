import 'package:ex_project/core/constants/color.dart';
import 'package:ex_project/core/widget/verify_common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_rating/star_rating.dart';

import 'bloc/reservation_detail_bloc.dart';

class ReservationReviewPage extends StatefulWidget {
  const ReservationReviewPage({super.key});

  @override
  State<ReservationReviewPage> createState() => _ReservationReviewPageState();
}

class _ReservationReviewPageState extends State<ReservationReviewPage> {
  final int starLength = 5;
  double _rating = 0;
  final FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: backgroundColor,
            centerTitle: true,
            title: const Text(
              'Review Restaurant',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            )),
        body: BlocBuilder<ReservationDetailBloc, ReservationDetailState>(
          builder: (context, state) {
            if (state is ReservationDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ReservationDetailLoadingSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#${state.reservation.id}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Center(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                              width: double.infinity,
                              height: 155,
                              image: AssetImage(
                                  state.reservation.restaurant?.image ??
                                      'assets/images/our restaurant.png'),
                              fit: BoxFit.cover),
                        ),
                      )),
                      Center(
                        child: Text(
                          '${state.reservation.restaurant?.name}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      StarRating(
                        mainAxisAlignment: MainAxisAlignment.center,
                        color: primaryColor,
                        length: starLength,
                        rating: _rating != 0
                            ? _rating
                            : state.reservation.rating ?? _rating,
                        onRaitingTap: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                        between: 5,
                        starSize: 45,
                      ),
                      const Text(
                        'Your comment',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 136,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _controller.text == '' ?_controller = TextEditingController(text: state.reservation.comment) : _controller,
                            focusNode: _focusNode,
                            onTapOutside: (event) => _focusNode.unfocus(),
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 40,
                          width: 114,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                ),
                                Text(
                                  'Photo',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )),
                      VerifyCommonButton(
                          onPressed: () {
                            state.reservation.comment = _controller.text;
                            state.reservation.rating = _rating;
                            BlocProvider.of<ReservationDetailBloc>(context).add(
                                ReservationSendReviewEvent(
                                    reservation: state.reservation));
                            if (state.reservation.comment != '' || state.reservation.rating != 0){
                              Navigator.pop(context);
                            } else{

                            }
                          },
                          title: 'SEND')
                    ],
                  ),
                ),
              );
            }
            if (state is ReservationDetailLoadingFailure) {
              return Center(child: Text(state.error));
            }
            return const SizedBox();
          },
        ));
  }
}
