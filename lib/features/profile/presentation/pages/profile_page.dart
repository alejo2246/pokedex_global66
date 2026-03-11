import 'package:flutter/material.dart';

import '../../../../design_system/components/molecules/app_error_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppErrorState(
      title: '¡Muy pronto disponible!',
      subtitle:
          'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.',
      image: 'jigglypuff_image.png',
    );
  }
}
