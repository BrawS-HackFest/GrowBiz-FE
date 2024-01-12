import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:video_player/video_player.dart';

class CardVideo extends StatefulWidget {
  CardVideo({super.key, required this.pathUrl});
  String pathUrl;

  @override
  State<CardVideo> createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        '${widget.pathUrl}'),
    )
      ..initialize().then((_) {
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Listener(
        onPointerDown: (_) {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: VideoPlayer(_controller),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.whiteBase,
                ),
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
