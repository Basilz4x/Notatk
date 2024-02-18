import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/features/note/ui/controllers/home_page_controller.dart';
import 'package:note_app/features/note/ui/controllers/search_page_controller.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:note_app/utils/constant/route_constant.dart';
import 'package:note_app/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class NoteCard extends ConsumerWidget {
  const NoteCard({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context, ref) {
    return FocusedMenuHolder(
      onPressed: () {
        context.pushNamed(AppRouter.notePage.name, extra: note);
      },
      animateMenuItems: true,
      blurSize: 2,
      menuWidth: 190,
      menuItemExtent: 45,
      duration: const Duration(milliseconds: 100),
      menuOffset: 0,
      bottomOffsetHeight: 20,
      menuItems: [
        FocusedMenuItem(
            title: const Text("Open"),
            trailingIcon: const Icon(Icons.open_in_new),
            onPressed: () {
              context.goNamed(AppRouter.addNotePage.name);
            }),
        FocusedMenuItem(
            title: const Text("Share"),
            trailingIcon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                "${note.title}\n${note.content}",
              );
            }),
        FocusedMenuItem(
          title: const Text(
            "Delete",
            style: TextStyle(color: AppColor.errorColor),
          ),
          trailingIcon: const Icon(
            Icons.delete,
            color: AppColor.errorColor,
          ),
          onPressed: () {
            ref.invalidate(searchPageControllerProvider);
            ref.read(homePageControllerProvider.notifier).removeNote(note);
          },
        ),
      ],
      child: Card(
        color: note.color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Utils.formatDate(note.dateCreated.toString()),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColor.backgroundColor.withOpacity(0.7),
                    fontSize: 19),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
