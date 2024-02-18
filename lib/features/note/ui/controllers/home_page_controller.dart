import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/data/local/note_local_repository.dart';
import 'package:note_app/features/note/domain/note.dart';

final homePageControllerProvider =
    AsyncNotifierProvider<HomePageController, List<Note>>(
        HomePageController.new);

class HomePageController extends AsyncNotifier<List<Note>> {
  @override
  Future<List<Note>> build() async {
    return getAllNotes();
  }

  Future<List<Note>> getAllNotes() async {
    return await ref.read(notesLocalRepositoryProvider).getAllNotes();
  }

  Future<void> addNote(Note noteToAdd) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await ref.read(notesLocalRepositoryProvider).addNote(noteToAdd);
      return getAllNotes();
    });
  }

  Future<void> removeNote(Note noteToRemove) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await ref.read(notesLocalRepositoryProvider).removeNote(noteToRemove);
      return getAllNotes();
    });
  }

  Future<void> updateNote({
    required String title,
    required String content,
    required String id,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(notesLocalRepositoryProvider)
          .updateNote(id: id, content: content, title: title);
      return getAllNotes();
    });
  }
}
