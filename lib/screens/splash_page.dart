import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller =
        VideoPlayerController.asset('assets/animations/splash_animation.mp4')
          ..initialize().then((_) {
            controller.play();
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                width: controller.value.size.width * 0.85,
                height: controller.value.size.height,
                child: VideoPlayer(controller),
              ),
            ),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
