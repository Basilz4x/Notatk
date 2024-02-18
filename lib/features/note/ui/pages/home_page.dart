import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/ui/widgets/custom_floating_action_button.dart';
import 'package:note_app/features/note/ui/widgets/home_page_error_design.dart';
import 'package:note_app/features/note/ui/widgets/no_notes_design.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/features/note/ui/controllers/home_page_controller.dart';
import 'package:note_app/features/note/ui/widgets/note_list_view.dart';
import 'package:note_app/features/note/ui/widgets/title_and_search_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final noteListAsync = ref.watch(homePageControllerProvider);
    return Scaffold(
      floatingActionButton: const SizedBox(
        height: 70,
        width: 70,
        child: CustomFloatingActionButton(),
      ),
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleAndSearchButton(),
            const SizedBox(height: 16),
            noteListAsync.when(
              data: (data) => data.isNotEmpty
                  ? NoteListView(noteList: data)
                  : const NoNotesDesign(),
              error: (e, stack) => const HomePageErrorDesign(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
