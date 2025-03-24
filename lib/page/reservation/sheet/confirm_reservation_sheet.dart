import 'package:ex_project/core/constants/color.dart';
import 'package:ex_project/data/model/restaurant.dart';
import 'package:ex_project/page/reservation/sheet/reservation_success_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/verify_common_button.dart';
import '../../../../data/model/user.dart';
import '../../../data/local_storage/user_preferences.dart';
import '../../../data/model/reservation/reservation.dart';
import '../../../data/model/reservation/reservation_history_detail.dart';
import '../../../data/model/reservation/reservation_status.dart';
import '../bloc/reservation_bloc.dart';

class ConfirmReservationSheet extends StatefulWidget {
  final String fullName;
  final String phone;
  final String email;
  final String address;
  final String description;
  final DateTime date;
  final String time;
  final int people;
  final String note;
  final ReservationHistoryDetail reservationHistoryDetail;

  const ConfirmReservationSheet(
      {super.key,
      required this.address,
      required this.description,
      required this.date,
      required this.time,
      required this.people,
      required this.note,
      required this.fullName,
      required this.phone,
      required this.email, required this.reservationHistoryDetail,
      });

  @override
  State<ConfirmReservationSheet> createState() =>
      _ConfirmReservationSheetState();
}

class _ConfirmReservationSheetState extends State<ConfirmReservationSheet> {
  User user = UserPreferences().getUser();

  @override
  Widget build(BuildContext context) {
    user.name = widget.fullName;
    user.phone = widget.phone;
    user.email = widget.email;
    Restaurant restaurant = Restaurant(
      address: widget.description,
      name: widget.address,
    );

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Reservation',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )),
            const SizedBox(
              height: 14,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: backgroundColor,
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
                              widget.address,
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
                              widget.description,
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
                      '${widget.date}',
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
                      widget.time,
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
                    Text('${widget.people} people',
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
                color: backgroundColor,
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
                              widget.fullName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.phone,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.email,
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
                  color: backgroundColor,
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
                        widget.note,
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
                  color: backgroundColor,
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
              title: 'CONFIRM',
              onPressed: () {
                widget.reservationHistoryDetail.addHistoryEntry(ReservationStatus.pending, DateTime.now());
                Reservation? reservation = Reservation(
                  user: user,
                  restaurant: restaurant,
                  date: widget.date,
                  orderTime: DateTime.now(),
                  numberOfPeople: widget.people,
                  note: widget.note,
                  time: widget.time,
                  reservationHistoryDetail: widget.reservationHistoryDetail,
                );
                context.read<ReservationBloc>().add(ReservationSuccessEvent(reservation));
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return BlocBuilder<ReservationBloc, ReservationState>(
                        builder: (context, state) {
                          if (state is ReservationLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is ReservationSuccess) {
                            return ReservationSuccessSheet(
                              reservation: state.reservation!,
                            );
                          }
                          return const SizedBox();
                        }
                      );
                    },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
