import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/data/local/note_local_repository.dart';
import 'package:note_app/features/note/domain/note.dart';

class SearchPageController extends AutoDisposeAsyncNotifier<List<Note>> {
  @override
  List<Note> build() {
    return [];
  }

  Future<void> searchNotes(String value) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(notesLocalRepositoryProvider).searchNotes(value));
  }
}

final searchPageControllerProvider =
    AutoDisposeAsyncNotifierProvider<SearchPageController, List<Note>>(
        SearchPageController.new);
