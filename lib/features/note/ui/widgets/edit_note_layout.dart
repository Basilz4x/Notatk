import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:note_app/features/note/ui/controllers/home_page_controller.dart';
import 'package:note_app/features/note/ui/widgets/custom_back_button.dart';
import 'package:note_app/features/note/ui/widgets/custom_save_button.dart';

class EditNoteLayout extends ConsumerStatefulWidget {
  const EditNoteLayout({super.key, required this.note});
  final Note note;

  @override
  ConsumerState<EditNoteLayout> createState() => _EditNoteLayoutState();
}

class _EditNoteLayoutState extends ConsumerState<EditNoteLayout> {
  final maxContentLength = 550;
  final maxTitleLength = 100;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
    titleController.addListener(() {
      setState(() {});
    });
    contentController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomBackButton(),
              CustomSaveButton(onPressed: () {
                ref.read(homePageControllerProvider.notifier).updateNote(
                    title: titleController.text,
                    content: contentController.text,
                    id: widget.note.id);
              }),
            ],
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: titleController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Title cannot be empty.';
              } else if (value.length > maxTitleLength) {
                return 'Title cannot exceed $maxTitleLength characters.';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            maxLines: 3,
            minLines: 1,
            cursorColor: AppColor.textColor.withOpacity(0.7),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColor.textColor, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: "${titleController.text.length}/$maxTitleLength",
              counterStyle: TextStyle(
                  color: titleController.text.length > maxTitleLength
                      ? Colors.red
                      : AppColor.textColor.withOpacity(0.7)),
              border: InputBorder.none,
              hintText: "Title",
              hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColor.textColor.withOpacity(0.7),
                  ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: contentController,
            validator: (contentValue) {
              if (contentValue == null || contentValue.isEmpty) {
                return 'Content cannot be empty.';
              } else if (contentValue.length > maxContentLength) {
                return 'Content cannot exceed $maxContentLength characters.';
              }
              return null;
            },
            textInputAction: TextInputAction.done,
            minLines: 1,
            maxLines: 20,
            cursorColor: AppColor.textColor.withOpacity(0.7),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColor.textColor,
                ),
            decoration: InputDecoration(
              counterText: "${contentController.text.length}/$maxContentLength",
              counterStyle: TextStyle(
                  color: contentController.text.length > maxContentLength
                      ? Colors.red
                      : AppColor.textColor.withOpacity(0.7)),
              border: InputBorder.none,
              hintText: "Type something...",
              hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColor.iconColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
