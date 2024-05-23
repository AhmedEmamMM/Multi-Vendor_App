import 'package:flutter/material.dart';

import '../../../../../../global_core/helpers/helpers.dart';
import 'cover_photo.dart';
import 'profile_photo.dart';

class CoverAndProfilePhotosStack extends StatelessWidget {
  const CoverAndProfilePhotosStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightOfTheScreen(context) * 0.405,
      child: const Stack(
        children: [
          CoverPhoto(),
          ProfilePhoto(),
        ],
      ),
    );
  }
}
