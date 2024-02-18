import 'package:go_router/go_router.dart';
import 'package:note_app/features/note/ui/pages/search_page.dart';
import 'package:note_app/utils/constant/route_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:note_app/features/note/ui/pages/home_page.dart';
import 'package:note_app/features/note/ui/pages/add_note_page.dart';
import 'package:note_app/features/note/ui/pages/note_page.dart';

final router = GoRouter(routes: [
  GoRoute(
      name: AppRouter.homePage.name,
      path: AppRouter.homePage.path,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
            path: AppRouter.addNotePage.path,
            name: AppRouter.addNotePage.name,
            builder: (context, state) => const AddNotePage()),
        GoRoute(
            path: AppRouter.notePage.path,
            name: AppRouter.notePage.name,
            builder: (context, state) {
              final Note note = state.extra as Note;
              return NotePage(note: note);
            }),
        GoRoute(
            path: AppRouter.searchPage.path,
            name: AppRouter.searchPage.name,
            builder: (context, state) => const SearchPage()),
      ]),
]);
