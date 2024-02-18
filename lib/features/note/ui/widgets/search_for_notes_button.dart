import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/ui/controllers/search_page_controller.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class SearchForNotesButton extends ConsumerWidget {
  const SearchForNotesButton({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(searchPageControllerProvider.notifier)
            .searchNotes(controller.text);
      },
      child: Container(
          alignment: Alignment.center,
          height: 55,
          width: 110,
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text("Search",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                  ))),
    );
  }
}
