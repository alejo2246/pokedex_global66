import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../design_system/tokens/app_colors.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AudioPlayer _audioPlayer;

  late final AnimationController _ctrl;
  late final Animation<double> _slideAnim;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _ringScaleAnim;
  late final Animation<double> _ringOpacityAnim;
  late final Animation<double> _wobbleAnim;
  late final Animation<double> _flashAnim;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 200));
      if (mounted) {
        _ctrl.forward();
        _playMusic();
      }
    });

    _slideAnim = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.0, 0.30, curve: Curves.easeOut),
      ),
    );

    _scaleAnim = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin: 0.1, end: 1.2), weight: 65),
        TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 35),
      ],
    ).animate(CurvedAnimation(parent: _ctrl, curve: const Interval(0.0, 0.45)));

    _ringScaleAnim = Tween<double>(begin: 1.0, end: 2.8).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.30, 0.55, curve: Curves.easeOut),
      ),
    );

    _ringOpacityAnim = Tween<double>(begin: 0.7, end: 0.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.30, 0.55, curve: Curves.easeOut),
      ),
    );

    _wobbleAnim =
        TweenSequence<double>([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.22), weight: 8),
          TweenSequenceItem(tween: Tween(begin: 0.22, end: -0.22), weight: 17),
          TweenSequenceItem(tween: Tween(begin: -0.22, end: 0.18), weight: 13),
          TweenSequenceItem(tween: Tween(begin: 0.18, end: -0.18), weight: 17),
          TweenSequenceItem(tween: Tween(begin: -0.18, end: 0.14), weight: 13),
          TweenSequenceItem(tween: Tween(begin: 0.14, end: 0.0), weight: 12),
        ]).animate(
          CurvedAnimation(parent: _ctrl, curve: const Interval(0.48, 0.80)),
        );

    _flashAnim =
        TweenSequence<double>([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.9), weight: 1),
          TweenSequenceItem(tween: Tween(begin: 0.9, end: 0.0), weight: 1),
        ]).animate(
          CurvedAnimation(parent: _ctrl, curve: const Interval(0.80, 0.96)),
        );
  }

  Future<void> _playMusic() async {
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _audioPlayer.setSource(
        AssetSource('audio/wobble_sound_effect.mp3'),
      );
      await _audioPlayer.setVolume(0.3);
      await _audioPlayer.resume();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<SplashDestination>>(splashViewModelProvider, (
      _,
      next,
    ) {
      next.whenData((destination) {
        switch (destination) {
          case SplashDestination.onboarding:
            context.goNamed(AppRoute.onboarding);
          case SplashDestination.home:
            context.goNamed(AppRoute.pokedex);
        }
      });
    });

    const double ballSize = 155;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, _) {
          return SizedBox.expand(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (_ctrl.value >= 0.30 && _ctrl.value <= 0.58)
                  Transform.scale(
                    scale: _ringScaleAnim.value,
                    child: Opacity(
                      opacity: _ringOpacityAnim.value.clamp(0.0, 1.0),
                      child: Container(
                        width: ballSize,
                        height: ballSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),

                Transform.translate(
                  offset: Offset(0, _slideAnim.value * screenHeight * 0.6),
                  child: Transform.scale(
                    scale: _scaleAnim.value,
                    child: Transform.rotate(
                      angle: _wobbleAnim.value,
                      child: SvgPicture.asset(
                        'assets/images/loader.svg',
                        width: ballSize,
                        height: ballSize,
                      ),
                    ),
                  ),
                ),

                if (_flashAnim.value > 0)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: ColoredBox(
                        color: Colors.white.withValues(alpha: _flashAnim.value),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
