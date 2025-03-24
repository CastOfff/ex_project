
import 'package:flutter/material.dart';

import '../../../core/widget/common_text_field.dart';
import '../../../core/widget/verify_common_button.dart';
import '../../../data/local_storage/user_preferences.dart';
import '../../../data/model/reservation/reservation_history_detail.dart';
import '../../../data/model/reservation/reservation_status.dart';
import '../../../data/model/user.dart';
import '../../../date_time.dart';
import '../../happy_deal_reservation/date_reservation_picked.dart';
import '../sheet/confirm_reservation_sheet.dart';

class ReservationTab extends StatefulWidget {
  const ReservationTab({super.key});

  @override
  State<ReservationTab> createState() => _ReservationTabState();
}

class _ReservationTabState extends State<ReservationTab> {
  final User user = UserPreferences().getUser();
  DateTime today = DateTime.now();
  late DateTime selectedDate;
  late DateTime selectedMonth;
  late List<DateTime> months;
  String? _selectedTime;
  late int people;
  bool vaccine = false;
  bool agree = false;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  // Hàm lấy danh sách ngày
  List<DateTime> getDaysInMonth(int year, int month,) {
    DateTime today = DateTime.now();
    DateTime firstDay = DateTime(year, month, 1);
    DateTime nextMonth = DateTime(year, month + 1, 1);
    int daysCount = nextMonth.difference(firstDay).inDays;

    if (year == today.year && month == today.month) {
      int startDay = today.day;
      int remainingDays = daysCount - startDay + 1;
      return List.generate(
        remainingDays,
            (index) => DateTime(year, month, startDay + index),
      );
    } else {
      return List.generate(
        daysCount,
            (index) => DateTime(year, month, index + 1),
      );
    }
  }

  @override
  void initState() {
    selectedDate = DateTime(today.year, today.month, today.day);
    selectedMonth = DateTime(today.year, today.month);
    months = List.generate(12 - today.month + 1,
            (index) => DateTime(today.year, today.month + index));
    people = 2;
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pick your date',
                      style: TextStyle(
                        color: Color(0xff140501),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10),
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<DateTime>(
                                value: selectedMonth,
                                items: months.map((month) {
                                  return DropdownMenuItem(
                                    value:
                                    DateTime(month.year, month.month),
                                    child: Text(
                                      '${monthsOfYear[month.month - 1]['name']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedMonth = DateTime(
                                          value.year, value.month);
                                    });
                                  }
                                },
                              )),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 5),
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${today.year}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              /// Pick DAY
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 22,),
                  const Icon(Icons.arrow_back_ios, size: 18,),
                  const SizedBox(width: 18,),
                  Expanded(
                    child: SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getDaysInMonth(
                            selectedMonth.year, selectedMonth.month)
                            .length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedDate = getDaysInMonth(
                                    selectedMonth.year,
                                    selectedMonth.month,
                                )[index];
                              });

                            },
                            child: DateReservationPicked(
                              today: today,
                              daysInMonth: getDaysInMonth(
                                  selectedMonth.year,
                                  selectedMonth.month)[index],
                              backgroundColor: selectedDate ==
                                  getDaysInMonth(selectedMonth.year,
                                      selectedMonth.month)[index]
                                  ? const Color(0xffa03225)
                                  : Colors.white,
                              textColor: selectedDate ==
                                  getDaysInMonth(selectedMonth.year,
                                      selectedMonth.month)[index]
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 18,),
                  const Icon(Icons.arrow_forward_ios, size: 18,),
                  const SizedBox(width: 22,),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pick your time',
                      style: TextStyle(
                        color: Color(0xff140501),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12.0),
                      height: 36,
                      color: Colors.white,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedTime,
                          items: timeSlots.map((timeSlot) {
                            return DropdownMenuItem<String>(
                              value: timeSlot,
                              child: Text(
                                timeSlot,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedTime = value;
                            });
                          },
                          hint: const Text(
                            'Chọn khung giờ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'How many people?',
                      style: TextStyle(
                        color: Color(0xff140501),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          minRadius: 16,
                          maxRadius: 16,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              if (people > 1) {
                                setState(() {
                                  people--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 16,
                            ),
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$people',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          minRadius: 16,
                          maxRadius: 16,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              if (people < 6) {
                                setState(() {
                                  people++;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 16,
                            ),
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              ///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: vaccine,
                      onChanged: (value) {
                        setState(() {
                          vaccine = !vaccine;
                        });
                      },
                    ),
                    const Text(
                      "Vaccine green passes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notes",
                    style: TextStyle(
                      color: Color(0xff140501),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onTapOutside: (event) => _focusNode.unfocus(),
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your information',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: CommonTextField(
                  controller: _fullNameController,
                  focusNode: FocusNode(),
                  hintText: 'Full name',
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: CommonTextField(
                  controller: _phoneController,
                  focusNode: FocusNode(),
                  hintText: 'Phone number',
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: CommonTextField(
                  controller: _emailController,
                  focusNode: FocusNode(),
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = !agree;
                        });
                      },
                    ),
                    const Text(
                      "I agree with restaurant terms of service",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: VerifyCommonButton(
                  title: 'RESERVE',
                  onPressed: () {
                    if (agree && _selectedTime != null && vaccine) {
                      showBottomSheet(
                          context: context,
                          builder: (context) {
                            ReservationHistoryDetail reservationHistoryDetail = ReservationHistoryDetail(
                              statusList: [],
                              timeLine: []
                            );
                            reservationHistoryDetail.addHistoryEntry(ReservationStatus.reserved, DateTime.now());
                            return ConfirmReservationSheet(
                              description: 'Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC',
                              address: 'An BBQ Dong Khoi',
                              time: _selectedTime ?? '',
                              date: selectedDate,
                              people: people,
                              note: _controller.text == '' ? 'Window Seats' :_controller.text ,
                              fullName: _fullNameController.text == '' ? '${user.name}' : _fullNameController.text,
                              phone: _phoneController.text == '' ? '${user.phone}' : _phoneController.text,
                              email: _emailController.text == '' ? '${user.email}' : _emailController.text,
                              reservationHistoryDetail: reservationHistoryDetail,
                            );
                          },
                      );
                    } else if(!agree) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please agree with terms of service'),
                        ),
                      );
                    } else if(_selectedTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a time'),
                        ),
                      );
                    } else if(!vaccine) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please vaccine with terms of service'),
                        ),
                      );
                    }
                  }
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
