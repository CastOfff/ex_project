import 'package:ex_project/core/widget/verify_common_button.dart';
import 'package:ex_project/data/model/reservation/reservation_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/color.dart';
import '../../../data/model/reservation/reservation.dart';
import '../../../router/router_name.dart';
import 'bloc/reservation_history_bloc.dart';


class ReservationHistoryPage extends StatefulWidget {
  const ReservationHistoryPage({super.key});

  @override
  State<ReservationHistoryPage> createState() => _ReservationHistoryPageState();
}

class _ReservationHistoryPageState extends State<ReservationHistoryPage> {
  late ReservationHistoryBloc yourReservationBloc;

  @override
  void initState() {
    super.initState();
    yourReservationBloc = ReservationHistoryBloc()
      ..add(ReservationHistoryFetchEvent());
  }

  @override
  void dispose() {
    yourReservationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationHistoryBloc>.value(
      value: yourReservationBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Your Reservations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ReservationHistoryBloc, ReservationHistoryState>(
                builder: (context, state) {
                  if (state is ReservationHistoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ReservationHistoryLoadingSuccess) {
                    if (state.reservations.isEmpty) {
                      return const Center(child: Text('No reservations found'));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.reservations.length,
                      itemBuilder: (context, index) {
                        final reversedReservations = state.reservations.reversed.toList();
                        Reservation reservation = reversedReservations[index];
                        String monthName = DateFormat('MMMM', 'en_US')
                            .format(reservation.date as DateTime);
                        String weekdayName = DateFormat('EEEE', 'en_US')
                            .format(reservation.date as DateTime);
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image(
                                              width: 50,
                                              height: 50,
                                              image: AssetImage(reservation
                                                      .restaurant?.image ??
                                                  'assets/images/our restaurant.png'),
                                              fit: BoxFit.cover),
                                        ),
                                        const SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${reservation.date?.day}th',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              // '${reservation.date?.month}, ${reservation.date?.year}',
                                              '$monthName, $weekdayName ',
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${reservation.restaurant?.name}',
                                    ),
                                    Text(
                                      '${reservation.numberOfPeople} people, ${reservation.time}',
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  Text(
                                    '#${reservation.id} ',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context,
                                            RouterName.reservationDetailPage,
                                            arguments: reservation.id
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 16,
                                        color: Colors.black,
                                      )),
                                  VerifyCommonButton(
                                    onPressed: () {},
                                    title: '${reservation.reservationHistoryDetail?.statusList.last.convertToString()}',
                                    borderRadius: BorderRadius.circular(0),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    height: 15,
                                    width: 58,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 10),
                                  )
                                ])
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (state is ReservationHistoryLoadingFailure) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
