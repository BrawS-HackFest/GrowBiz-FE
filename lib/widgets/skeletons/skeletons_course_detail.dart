import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonsCourseDetail extends StatelessWidget {
  const SkeletonsCourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.neutral,
      highlightColor: MyColors.neutral200,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 202,
              color: MyColors.neutra100,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 167,
              height: 24,
              color: MyColors.neutra100,
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: 50,
              height: 16,
              color: MyColors.neutra100,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 16,
                  color: MyColors.neutra100,
                ),
                Container(
                  width: 70,
                  height: 16,
                  color: MyColors.neutra100,
                ),
                Container(
                  width: 38,
                  height: 16,
                  color: MyColors.neutra100,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 254,
              height: 38,
              color: MyColors.neutra100,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 112,
              color: MyColors.neutra100,
            ),
            const SizedBox(height: 19,),
            Container(
              width: double.infinity,
              height: 49,
              color: MyColors.neutra100,
            ),
          ],
        ),
      ),
    );
  }
}
