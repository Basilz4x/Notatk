import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:note_app/features/note/ui/pages/note_page.dart';
import 'package:note_app/features/note/ui/widgets/custom_back_button.dart';
import 'package:note_app/features/note/ui/widgets/custom_edit_button.dart';
import 'package:note_app/features/note/ui/widgets/custom_share_button.dart';
import 'package:note_app/utils/utils.dart';

class ReadNoteLayout extends ConsumerWidget {
  const ReadNoteLayout({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomBackButton(),
            Spacer(),
            CustomShareButton(note: note),
            SizedBox(
              width: 20,
            ),
            CustomEditButton(onPressed: () {
              ref.read(editIsClickedProvider.notifier).update((state) => true);
            }),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          note.title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.textColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          Utils.formatDate(note.dateCreated.toString()),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.textColor.withOpacity(0.7),
                fontSize: 20.5,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          note.content,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColor.textColor, fontSize: 20),
        ),
      ],
    );
  }
}
