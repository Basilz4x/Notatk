import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/ui/controllers/search_page_controller.dart';
import 'package:note_app/features/note/ui/widgets/custom_back_button.dart';
import 'package:note_app/features/note/ui/widgets/custom_search_bar.dart';
import 'package:note_app/features/note/ui/widgets/no_search_result_design.dart';
import 'package:note_app/features/note/ui/widgets/note_list_view.dart';
import 'package:note_app/features/note/ui/widgets/search_for_notes_button.dart';
import 'package:note_app/features/note/ui/widgets/search_page_error_design.dart';
import 'package:note_app/utils/constant/color_constant.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchedTextController = TextEditingController();

  @override
  void dispose() {
    _searchedTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchedListAsync = ref.watch(searchPageControllerProvider);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  SearchForNotesButton(controller: _searchedTextController)
                ],
              ),
              CustomSearchBar(controller: _searchedTextController),
              const SizedBox(
                height: 10,
              ),
              searchedListAsync.when(
                  data: (data) {
                    if (data.isEmpty) {
                      print("yes yes");
                      return const NoSearchResultDesign();
                    }
                    return NoteListView(noteList: data);
                  },
                  error: (e, stack) {
                    return const SearchPageErrorDesign();
                  },
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
