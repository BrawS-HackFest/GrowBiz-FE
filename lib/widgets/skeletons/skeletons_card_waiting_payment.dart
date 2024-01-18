import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:shimmer/shimmer.dart';
class SkeletonsCardWaitingPayment extends StatelessWidget {
  const SkeletonsCardWaitingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.neutral,
      highlightColor: MyColors.neutral200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Container(
          width: double.infinity,
          height: 260,
          padding: EdgeInsets.all(11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 167,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: MyColors.neutra100,
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                width: 260,
                height: 16,
                color: MyColors.neutra100,
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 74,
                      height: 32,
                      color: MyColors.neutra100,
                    ),
                    Container(
                      width: 74,
                      height: 32,
                      color: MyColors.neutra100,
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
