import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/common/custom_appbar.dart';
import 'package:flutter_multi_vendor/common/custom_container.dart';
import 'package:flutter_multi_vendor/common/heading.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/views/home/all_fastest_foods_page.dart';
import 'package:flutter_multi_vendor/views/home/all_nearby_restaurants.dart';
import 'package:flutter_multi_vendor/views/home/recommendations_page.dart';
import 'package:flutter_multi_vendor/views/home/widgets/category_list.dart';
import 'package:flutter_multi_vendor/views/home/widgets/foods_list.dart';
import 'package:flutter_multi_vendor/views/home/widgets/nearby_restaurants_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Heading(
                text: "Nearby Restaurants",
                onTap: () {
                  Get.to(
                    () => const AllNearbyRestaurants(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              NearbyRestaurantsList(),
              Heading(
                text: "Try Something New",
                onTap: () {
                  Get.to(
                    () => const RecommendationsPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              FoodsList(),
              Heading(
                text: "Food Closer To You",
                onTap: () {
                  Get.to(
                    () => const AllFastestFoodsPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              FoodsList(),
            ],
          ),
        ),
      ),
    );
  }
}
