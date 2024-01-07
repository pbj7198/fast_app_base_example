import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:flutter/material.dart';

import 'd_notification.dart';
import 'notification_dummy.dart';
import 'w_notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('알림'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => NotificationItemWidget(
                onTap: () {
                  NotificationDialog([notificationDummies[0], notificationDummies[1]]).show();
                },
                notification: notificationDummies[index],
              ),
              childCount: notificationDummies.length,
            ),
          )
        ],
      ),
    );
  }
}
