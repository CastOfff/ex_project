
import 'package:ex_project/data/model/reservation/reservation_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/color.dart';
import '../../../core/widget/verify_common_button.dart';
import 'bloc/reservation_detail_bloc.dart';

class ReservationDetailPage extends StatelessWidget {

  const ReservationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
      )
      ),
      body: BlocBuilder<ReservationDetailBloc, ReservationDetailState>(
        builder: (context, state) {
          if (state is ReservationDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ReservationDetailLoadingSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '#${state.reservation.id}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.reservation.reservationHistoryDetail?.statusList.length,
                        itemBuilder: (context, index) {
                          final statusList = state.reservation.reservationHistoryDetail?.statusList.reversed.toList();
                          final timeLineList = state.reservation.reservationHistoryDetail?.timeLine.reversed.toList();
                          final status = statusList?[index].convertToString();
                          final timeLine = timeLineList?[index];
                          return Row(
                            children: [
                              const SizedBox(width: 6,),
                              Icon(Icons.circle, color: index == 0 ? Colors.green : Colors.grey, size: 15,),
                              const SizedBox(width: 22,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$status'),
                                  Text('$timeLine')
                                ],
                              ),
                            ],
                          );
                        },),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: primaryColor,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${state.reservation.restaurant?.address}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${state.reservation.restaurant?.address}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.calendar_month,
                              color: primaryColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Text(
                              '${state.reservation.date}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ]),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.access_time,
                              color: primaryColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Text(
                              state.reservation.time ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ]),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(children: [
                            const Icon(
                              Icons.person,
                              color: primaryColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Text('${state.reservation.numberOfPeople} people',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ))
                          ])
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 40,
                                  backgroundImage: AssetImage('assets/images/avatar.png'),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.reservation.user?.name ?? '',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          state.reservation.user?.phone ?? '',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          state.reservation.user?.email ?? '',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    )
                                )
                              ],
                            )
                          ],
                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.edit,
                              color: primaryColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Text(
                                state.reservation.note ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.credit_card,
                              color: primaryColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your deposit is 200.000VND',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    'Please pay within 30 minutes. If not, your reservation will be canceled automatically.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor,
                                    ),
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    VerifyCommonButton(
                      title: 'RE - RESERVATION',
                      onPressed: () {

                      },
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      )
    );
  }
}
