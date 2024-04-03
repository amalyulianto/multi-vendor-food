// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/common/app_style.dart';
import 'package:flutter_multi_vendor/common/reusable_text.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/controllers/category_controller.dart';
import 'package:flutter_multi_vendor/views/categories/all_categories.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category['_id']) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(
            () => const AllCategories(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900),
          );
        } else {
          controller.updateCategory = category['_id'];
          controller.updateTitle = category['title'];
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.only(top: 4.h),
        width: width * 0.19,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: kOffWhite, width: 1.w),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
              child: Image.network(
                category['imageUrl'],
                fit: BoxFit.contain,
              ),
            ),
            ReusableText(
              text: category['title'],
              textStyle: textStyle(12, kDark, FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
