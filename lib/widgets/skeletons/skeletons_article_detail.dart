import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:shimmer/shimmer.dart';
class SkeletonsArticleDetail extends StatelessWidget {
  const SkeletonsArticleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.neutral,
      highlightColor: MyColors.neutral200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 21),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 30,
              color: MyColors.neutra100,
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 202,
              decoration: BoxDecoration(
                color: MyColors.neutra100,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 53,
                  height: 16,
                  color: MyColors.neutra100,
                ),
                const SizedBox(width: 20,),
                Container(
                  width: 91,
                  height: 16,
                  color: MyColors.neutra100,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 80,
              color: MyColors.neutra100,
            ),
          ],
        ),
      ),
    );
  }
}
