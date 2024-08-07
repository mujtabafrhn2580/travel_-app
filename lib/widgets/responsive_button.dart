import 'package:flutter/material.dart';

import 'package:travel_app_bloc/misc/colors.dart';
import 'package:travel_app_bloc/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({super.key, this.width, this.isResposive = false});
  final bool isResposive;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.mainColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isResposive)
            const AppText(
              text: 'Book Trip Now',
              color: Colors.white,
            ),
          Image.asset('img/button-one.png')
        ],
      ),
    );
  }
}
