import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/ui/style/base_color.dart';
import 'package:fresh_fashion_mobile/core/ui/style/base_text_style.dart';
import 'package:fresh_fashion_mobile/src/common/utils/constants/global_key.dart';

enum SnackBarState { success, error }

showSnackBar({required String content, SnackBarState? state}) {
  scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
    backgroundColor: _mapStateToBackgroundColor(state),
    content: Text(
      content,
      style: BaseTextStyle.body1(color: Colors.white),
    ),
  ));
}

Color _mapStateToBackgroundColor(SnackBarState? state) {
  switch (state) {
    case SnackBarState.success:
      return BaseColor.green600;
    case SnackBarState.error:
      return BaseColor.red600;
    default:
      return BaseColor.greyNeutral600;
  }
}
