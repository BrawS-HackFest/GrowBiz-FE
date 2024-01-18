import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:shimmer/shimmer.dart';
class SkeletonsCardAllCourse extends StatelessWidget {
  const SkeletonsCardAllCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.neutral,
      highlightColor: MyColors.neutral200,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 179,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.neutra100,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  height: 16,
                  color: MyColors.neutra100,
                ),
                Container(
                  width: 72,
                  height: 22,
                  color: MyColors.neutra100,
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 52 ,
                  height: 16,
                  color: MyColors.neutra100,
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 93,
                  height: 22,
                  color: MyColors.neutra100,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
