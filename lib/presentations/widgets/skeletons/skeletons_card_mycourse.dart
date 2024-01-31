import 'package:flutter/material.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:shimmer/shimmer.dart';
class SkeletonsCardMyCourse extends StatelessWidget {
  const SkeletonsCardMyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.neutral,
      highlightColor: MyColors.neutral200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Container(
            width: double.infinity,
            height: 245,
            padding:const  EdgeInsets.all(11),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 167,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyColors.neutra100
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width:127,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: MyColors.neutra100,
                            borderRadius: BorderRadius.circular(16)
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  width: 250,
                  height: 16,
                  color: MyColors.neutra100,
                ),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 16,
                      color: MyColors.neutra100,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.neutra100
                      ),
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );;
  }
}
