import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonsCardArticle extends StatelessWidget {
  const SkeletonsCardArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.neutral,
      highlightColor: MyColors.neutral200,
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: MyColors.neutra100
            ),
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 210,
                  height: 16,
                    color: MyColors.neutra100
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 210,
                  height: 48,
                  decoration: BoxDecoration(
                      color: MyColors.neutra100
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
