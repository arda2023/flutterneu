import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
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
          // 1. Hintergrund-Video (liegt ganz unten im Stack)
          const _OnboardingVideoPage(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Colors.black, Colors.black.withValues(alpha: 0.3)],
              ),
            ),
          ),
          // 2. Wischbare Seiten
          SafeArea(
            child: PageView(
              controller: _controller,
              children: [
                // Seite 1
                _OnboardingStep(
                  title: "Cooking Made Easy",
                  description:
                      "This will help us customize the recipe feed to your preferences",
                  buttonText: "Jetzt loslegen",
                  onButtonPressed: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                // Seite 2
                _OnboardingStep(
                  title: "Finde Rezepte",
                  description:
                      "Entdecke Tausende Rezepte basierend auf deinen Zutaten.",
                  buttonText: "Loslegen",
                  onButtonPressed: () {
                    // Navigator.push(...) zum Home-Screen
                  },
                ),
              ],
            ),
          ),

          // 3. Indicator schwebt unten über allem
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 90,
                ), // Platz für den Button lassen
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: WormEffect(
                    spacing: 16,
                    dotColor: Colors.white38,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                  onDotClicked: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// CLEAN CODE: Wiederverwendbares Widget für Onboarding-Seiten
// =======================================================
class _OnboardingStep extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const _OnboardingStep({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      // EIN zentrales Padding für den gesamten Bildschirminhalt!
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 50), // Abstand nach oben
          // Titel
          Text(
            title,
            style: textTheme.displayMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16), // Sauberer Abstand zwischen Texten
          // Beschreibung
          Text(
            description,
            style: textTheme.titleMedium?.copyWith(
              color:
                  Colors.white70, // Saubere Flutter-Standardfarbe für 70% Weiß
            ),
            textAlign: TextAlign.center,
          ),

          const Spacer(), // Drückt den Button automatisch ganz nach unten!
          // Button übernimmt jetzt perfekt die volle Breite aus deinem AppTheme!
          ElevatedButton(onPressed: onButtonPressed, child: Text(buttonText)),
        ],
      ),
    );
  }
}

// =======================================================
// VIDEO-HINTERGRUND (Kapselt auch das dunkle Overlay!)
// =======================================================
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
    _videoController = VideoPlayerController.asset('assets/bgvideo25fps.mp4')
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

        // Das dunkle Overlay gehört DIREKT zum Video-Hintergrund!
        Container(color: Colors.black.withValues(alpha: 0.5)),
      ],
    );
  }
}
