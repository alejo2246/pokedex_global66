import 'package:flutter/material.dart';
import 'package:pokedex/l10n/l10n.dart';

import '../../../../design_system/components/molecules/app_error_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppErrorState(
      title: context.l10n.comingSoon,
      subtitle: context.l10n.comingSoonSubtitle,
      image: 'jigglypuff_image.png',
    );
  }
}
