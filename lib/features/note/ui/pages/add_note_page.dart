import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/utils/constant/app_constant.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:note_app/features/note/ui/controllers/home_page_controller.dart';
import 'package:note_app/features/note/ui/widgets/custom_back_button.dart';
import 'package:note_app/features/note/ui/widgets/custom_save_button.dart';

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final _maxTitleLength = AppConstant.maxTitleLength;
  final _maxContentLength = AppConstant.maxContentLength;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      ref.read(homePageControllerProvider.notifier).addNote(Note(
            title: _titleController.text,
            content: _contentController.text,
            dateCreated: DateTime.now(),
            dateModified: DateTime.now(),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      setState(() {});
    });
    _contentController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomBackButton(),
                      CustomSaveButton(onPressed: _submitForm),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty.';
                      } else if (value.length > _maxTitleLength) {
                        return 'Title cannot exceed $_maxTitleLength characters.';
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
                      counterText:
                          "${_titleController.text.length}/$_maxTitleLength",
                      counterStyle: TextStyle(
                          color: _titleController.text.length > _maxTitleLength
                              ? Colors.red
                              : AppColor.textColor.withOpacity(0.7)),
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColor.textColor.withOpacity(0.7),
                              ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _contentController,
                    validator: (contentValue) {
                      if (contentValue == null || contentValue.isEmpty) {
                        return 'Content cannot be empty.';
                      } else if (contentValue.length > _maxContentLength) {
                        return 'Content cannot exceed $_maxContentLength characters.';
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
                      counterText:
                          "${_contentController.text.length}/$_maxContentLength",
                      counterStyle: TextStyle(
                          color:
                              _contentController.text.length > _maxContentLength
                                  ? Colors.red
                                  : AppColor.textColor.withOpacity(0.7)),
                      border: InputBorder.none,
                      hintText: "Type something...",
                      hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColor.textColor.withOpacity(0.7),
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
