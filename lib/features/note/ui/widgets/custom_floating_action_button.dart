import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/utils/constant/route_constant.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: AppColor.secondaryColor,
      foregroundColor: AppColor.iconColor,
      splashColor: AppColor.backgroundColor,
      onPressed: () {
        context.pushNamed(AppRouter.addNotePage.name);
      },
      child: const Icon(
        Icons.add_rounded,
        size: 42,
      ),
    );
  }
}
