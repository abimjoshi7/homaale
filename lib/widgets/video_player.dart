// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoURL,
  });
  final String videoURL;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool videoPlayerInitialized = false;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    videoPlayerController = VideoPlayerController.network(widget.videoURL);
    await videoPlayerController.initialize().then((_) {
      setState(() {
        videoPlayerInitialized = true;
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 1,
          autoInitialize: true,
          autoPlay: true,
          allowFullScreen: false,
        );
      });
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videoPlayerInitialized
        ? chewieController.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: chewieController,
              )
            : const Center(
                child: CardLoading(
                height: 200,
              ))
        : const Center(
            child: CardLoading(
              height: 200,
            ),
          );
  }
}
