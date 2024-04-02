import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/common/app_style.dart';
import 'package:flutter_multi_vendor/common/background_container.dart';
import 'package:flutter_multi_vendor/common/reusable_text.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_multi_vendor/views/home/widgets/food_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllFastestFoodsPage extends StatelessWidget {
  const AllFastestFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondary,
        elevation: 0.3,
        title: ReusableText(
          text: "Fastest Foods",
          textStyle: textStyle(13, kLightWhite, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              foods.length,
              (i) {
                var food = foods[i];
                return FoodTile(
                  food: food,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
