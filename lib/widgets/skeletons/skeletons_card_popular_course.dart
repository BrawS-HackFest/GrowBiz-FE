import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:shimmer/shimmer.dart';
class SkeletonsCardPopularCourse extends StatelessWidget {
  const SkeletonsCardPopularCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.neutral,
      highlightColor: MyColors.neutral200,
      child: Container(
        width: 197,
        height: 197,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 124,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.neutra100
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              width: 154,
              height: 16,
              color: MyColors.neutra100,
            ),
            const SizedBox(height: 5,),
            Container(
              width: 50,
              height: 13,
              color: MyColors.neutra100,
            ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Container(
                  width: 66,
                  height: 16,
                  color: MyColors.neutra100,
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 70,
                  height: 16,
                  color: MyColors.neutra100,
                )
              ],
            ),


          ],
        ),
      ),
    );;
  }
}
