import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/common/app_style.dart';
import 'package:flutter_multi_vendor/common/reusable_text.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantsTile extends StatelessWidget {
  const RestaurantsTile({super.key, required this.restaurant});

  final dynamic restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: kOffWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.network(
                            restaurant['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 6.w,
                              bottom: 2.h,
                            ),
                            color: kGray.withOpacity(.6),
                            height: 16.h,
                            width: width,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: kSecondary,
                              ),
                              itemSize: 15.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: restaurant['title'],
                        textStyle: textStyle(11, kDark, FontWeight.w400),
                      ),
                      ReusableText(
                        text: "Delivery time: ${restaurant['title']}",
                        textStyle: textStyle(11, kGray, FontWeight.w400),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          restaurant['coords']['address'],
                          style: textStyle(9, kGray, FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60.w,
              height: 19.h,
              decoration: BoxDecoration(
                color: restaurant['isAvailable'] == true ||
                        restaurant['isAvailable'] == null
                    ? kPrimary
                    : kSecondaryLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurant['isAvailable'] == true ||
                          restaurant['isAvailable'] == null
                      ? "OPEN"
                      : "CLOSED",
                  textStyle: textStyle(12, kLightWhite, FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
