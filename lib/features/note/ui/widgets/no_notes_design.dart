import 'package:flutter/material.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class NoNotesDesign extends StatelessWidget {
  const NoNotesDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset("lib/assets/images/empty_note.png"),
            Text(
              "Empty Notes",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColor.iconColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Add your first note",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColor.textColor.withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                ),
                Transform.rotate(
                  angle: 00.3,
                  child: Image.asset(
                    "lib/assets/images/arrow.png",
                    color: AppColor.secondaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
