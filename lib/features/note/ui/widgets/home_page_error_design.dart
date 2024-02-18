import 'package:flutter/material.dart';
import 'package:note_app/features/note/ui/widgets/custom_refresh_button.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class HomePageErrorDesign extends StatelessWidget {
  const HomePageErrorDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Transform.scale(
            scaleX: -1.35,
            scaleY: 1.35,
            child: Image.asset(
              'lib/assets/images/pencil.png',
            )),
        Text(
          "Oups! Something went wrong!",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.textColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "We encountered an error while trying show your notes. Will you please try again?!",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColor.textColor,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        const CustomRefreshButton(),
      ],
    );
  }
}
