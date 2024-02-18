import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/utils/constant/route_constant.dart';

class TitleAndSearchButton extends StatelessWidget {
  const TitleAndSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Notes",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.textColor),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(AppRouter.searchPage.name);
          },
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(12)),
            child: const Icon(
              Icons.search_rounded,
              color: AppColor.iconColor,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
