import 'package:alhilal_store/features/home/presentation/widgets/countru_drop_down.dart';
import 'package:alhilal_store/features/home/presentation/widgets/filterListView.dart';
import 'package:alhilal_store/features/home/presentation/widgets/notification_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/section_header.dart';
import '../widgets/filter_result_gridview.dart';
import '../widgets/slider_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
            child: Column(
          children: [
            NotificationContainer(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'What are you looking for...',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CountryDropdown(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SliderListView(),
            SizedBox(
              height: 20.h,
            ),
            FilterListView(),
            SizedBox(
              height: 20.h,
            ),
            SectionHeader(
              text: "Products",
            ),
            SizedBox(
              width: 10.w,
            ),
            FilterResultGridView(),
          ],
        )),
      ),
    );
  }
}
