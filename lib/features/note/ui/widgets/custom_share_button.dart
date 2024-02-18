import 'package:flutter/material.dart';
import 'package:note_app/utils/constant/color_constant.dart';
import 'package:note_app/features/note/domain/note.dart';
import 'package:share_plus/share_plus.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await Share.share("hello hello hello hello", subject: "title:");
        },
        child: Container(
            alignment: Alignment.center,
            height: 53,
            width: 53,
            decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              String.fromCharCode(Icons.share.codePoint),
              style: TextStyle(
                inherit: false,
                fontSize: 27,
                fontWeight: FontWeight.w500,
                fontFamily: Icons.share.fontFamily,
              ),
            )));
  }
}
