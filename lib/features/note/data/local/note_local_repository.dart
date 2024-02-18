import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/utils/constant/local_storage_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteLocalRepository {
  Future<List<Note>> getAllNotes() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? notesJson =
        sharedPreferences.getString(AppLocalStorage.allNotes);
    if (notesJson != null) {
      final List<dynamic> decodedJson = jsonDecode(notesJson);
      final List<Note> notes =
          decodedJson.map((json) => Note.fromJson(json)).toList();
      return notes;
    }
    return [];
  }

  Future<void> addNote(Note newNote) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final List<Note> existingNotes = await getAllNotes();

    existingNotes.add(newNote);

    final List<Map<String, dynamic>> notesJsonList = existingNotes
        .map(
          (note) => note.toJson(),
        )
        .toList();

    final notesEncodedJson = json.encode(notesJsonList);

    await sharedPreferences.setString(
        AppLocalStorage.allNotes, notesEncodedJson);
  }

  Future<void> removeNote(Note noteToRemove) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<Note> existingNotes = await getAllNotes();
    existingNotes.removeWhere((note) => note.id == noteToRemove.id);
    final List<Map<String, dynamic>> notesJsonList =
        existingNotes.map((note) => note.toJson()).toList();
    final String notesEncodedJson = json.encode(notesJsonList);
    await sharedPreferences.setString(
        AppLocalStorage.allNotes, notesEncodedJson);
  }

  Future<void> updateNote({
    required String id,
    required String content,
    required String title,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<Note> existingNote = await getAllNotes();
    final int noteIndex = existingNote.indexWhere((note) => note.id == id);

    if (noteIndex != -1) {
      existingNote[noteIndex] = existingNote[noteIndex].copyWith(
          title: title, content: content, dateModified: DateTime.now());
      final List<Map<String, dynamic>> notesToJson =
          existingNote.map((note) => note.toJson()).toList();
      final String notesEncoded = json.encode(notesToJson);

      await sharedPreferences.setString(AppLocalStorage.allNotes, notesEncoded);
    }
  }

  Future<List<Note>> searchNotes(String value) async {
    List<Note> allNotes = await getAllNotes();
    List<Note> searchedNotes = allNotes
        .where((note) =>
            note.title.contains(value) || note.content.contains(value))
        .toList();
    return searchedNotes;
  }
}

final notesLocalRepositoryProvider = Provider((ref) => NoteLocalRepository());
