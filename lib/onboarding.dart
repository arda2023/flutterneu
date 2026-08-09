import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Center(
                child: Column(
                  children: [
                    Text("1", style: Theme.of(context).textTheme.displayMedium),
                    Text(
                      "This will help us customize the recipe feed to your preferences",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text("2", style: Theme.of(context).textTheme.displayMedium),
                    Text(
                      "This will help us customize the recipe feed to your preferences",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SmoothPageIndicator(
                controller: _controller, // PageController
                count: 2,
                effect: WormEffect(
                  spacing: 20,
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ), // your preferred effect
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingVideoPage extends StatefulWidget {
  const _OnboardingVideoPage();

  @override
  State<_OnboardingVideoPage> createState() => _OnboardingVideoPageState();
}

class _OnboardingVideoPageState extends State<_OnboardingVideoPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset('assets/videos/bgvideo25fps.mp4')
          ..setVolume(0.0)
          ..setLooping(true)
          ..initialize().then((_) {
            _videoController.play();
            setState(() {});
          });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video-Hintergrund
        if (_videoController.value.isInitialized)
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoController.value.size.width,
                height: _videoController.value.size.height,
                child: VideoPlayer(_videoController),
              ),
            ),
          )
        else
          Container(color: Colors.black),

        // Text & Inhalt über dem Video
        Center(
          child: Text(
            "Willkommen!",
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
