import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

class CardWaitingPayment extends StatefulWidget {
  CardWaitingPayment({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.onTap
  }) : super(key: key);

  final String image;
  final String title;
  final String date;
  final VoidCallback onTap;

  @override
  State<CardWaitingPayment> createState() => _CardWaitingPaymentState();
}

class _CardWaitingPaymentState extends State<CardWaitingPayment> {
  late Duration remainingTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingTime = calculateRemainingTime();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        remainingTime = calculateRemainingTime();
      });
      if (remainingTime.inSeconds <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Duration calculateRemainingTime() {
    DateTime endTime = DateTime.parse(widget.date).add(Duration(hours: 24));
    DateTime currentTime = DateTime.now();
    Duration difference = endTime.difference(currentTime);
    return difference.isNegative ? Duration.zero : difference;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        width: double.infinity,
        height: 255,
        padding: const EdgeInsets.all(11),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x549B9B9B),
              blurRadius: 7,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
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
                image: DecorationImage(
                  image: NetworkImage('${widget.image}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 225,
                    margin:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/warning_icon.svg',
                          color: Color(0xFFFF0000),
                        ),
                        Text(
                          'Segera Lakukan Pembayaran',
                          style: MyTextStyle.captionH5(
                            color: Color(0xFFFF0000),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              widget.title,
              style: MyTextStyle.judulH5(color: MyColors.blackBase),
            ),
            const SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Sisa waktu',
                        style: MyTextStyle.judulH5(color: MyColors.grey200),
                      ),
                      const SizedBox(width: 3,),
                      Text(
                        formatDuration(remainingTime),
                        style: MyTextStyle.judulH5(
                          color: MyColors.primaryBase,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: MyColors.primaryBase,
                    ),
                    child: Text(
                      'Detail',
                      style: MyTextStyle.captionH5(
                        color: MyColors.whiteBase,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    return "${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
