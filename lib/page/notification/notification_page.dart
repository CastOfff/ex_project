import 'package:ex_project/core/constants/color.dart';
import 'package:ex_project/page/notification/helper/notification_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/notification_model.dart';
import 'bloc/notification_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late NotificationBloc notificationBloc;

  @override
  void initState() {
    super.initState();
    notificationBloc = NotificationBloc()
      ..add(NotificationFetchEvent());
  }

  @override
  void dispose() {
    notificationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>.value(
      value: notificationBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            TextButton(onPressed: () {
              notificationBloc.add(NotificationMarkAllAsReadEvent());
            }, child: const Text('Mark all as read', style: TextStyle(color: primaryColor),),)
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
                if (state is NotificationLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is NotificationFetchDataSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          notificationBloc.add(NotificationMarkAsReadEvent(notification: state.notifications[index]));
                        },
                        child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                            color: state.notifications[index].isRead
                                ? Colors.white
                                : const Color(0xFFFDE0DC),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        'assets/images/Logo3 2.png',
                                        width: 32,
                                        height: 45,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              state.notifications[index]
                                                  .getNotificationMessage(),
                                              Text(
                                                  '${state.notifications[index].createdAt}')
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20,)),
                                )
                              ],
                            )),
                      );
                    },
                  );
                }
                if (state is NotificationFetchDataError) {
                  return Center(child: Text(state.error));
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
