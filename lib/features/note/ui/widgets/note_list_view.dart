import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:note_app/features/note/ui/widgets/note_card.dart';

class NoteListView extends ConsumerWidget {
  const NoteListView({super.key, required this.noteList});
  final List<Note> noteList;
  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: MasonryGridView.builder(
          itemCount: noteList.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) {
            return NoteCard(
              note: noteList[index],
            );
          }),
    );
  }
}
