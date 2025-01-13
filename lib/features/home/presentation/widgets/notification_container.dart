import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 60.h,
              decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.r),
    color: Colors.white,
              ),
              child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'welcome back!',
            style: TextStyle(color: Colors.grey, fontSize: 15.sp),
          ),
          Text(
            'Saad Adel',
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
        ],
      ),
      Icon(Icons.notification_important_outlined)
    ],
              ),
            );
  }
}