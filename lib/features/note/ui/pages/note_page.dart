import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:note_app/features/note/ui/widgets/edit_note_layout.dart';
import 'package:note_app/features/note/ui/widgets/read_note_layout.dart';

class NotePage extends ConsumerStatefulWidget {
  const NotePage({Key? key, required this.note}) : super(key: key);
  final Note note;
  @override
  ConsumerState<NotePage> createState() => _NotePage();
}

class _NotePage extends ConsumerState<NotePage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(editIsClickedProvider);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ref.read(editIsClickedProvider)
                ? EditNoteLayout(
                    note: widget.note,
                  )
                : ReadNoteLayout(
                    note: widget.note,
                  ),
          ),
        ),
      ),
    );
  }
}

final editIsClickedProvider = StateProvider.autoDispose((ref) => false);
