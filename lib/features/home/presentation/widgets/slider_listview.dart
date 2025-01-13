import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets.dart';

class SliderListView extends StatelessWidget {
  const SliderListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        itemBuilder: (context, index) => Image.asset(
          Assets.assetsImgsBanner2,
          fit: BoxFit.cover,
        ),
        itemCount: 2,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
