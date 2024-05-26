import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../global_core/helpers/helpers.dart';
import 'cover_photo.dart';
import 'profile_photo.dart';

class CoverAndProfilePhotosStack extends StatelessWidget {
  const CoverAndProfilePhotosStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (heightOfTheScreen(context) * 0.405).h,
      child: const Stack(
        children: [
          CoverPhoto(),
          ProfilePhoto(),
        ],
      ),
    );
  }
}
