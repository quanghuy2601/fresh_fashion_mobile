import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/base/validation_layer/domain/usecase/app_store_usecase.dart';

class UnSupportVersionScreen extends StatelessWidget {
  const UnSupportVersionScreen({super.key, required this.appVersion});

  final String appVersion;

  _gotoStore(BuildContext context) async {
    AppStoreUseCase().goToStore().then((value) {
      if (value.isRight) return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("UnSupportVersionScreen"),
      ),
    );
  }
}

    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 20),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           ExceptionWidget(
    //             onPress: () {
    //               DebounceController().start(function: () => _gotoStore(context));
    //             },
    //             titleWidget: RichText(
    //               text: TextSpan(style: BaseTextStyle.button1(), text: S.current.txt_version, children: [
    //                 TextSpan(text: " $appVersion ", style: BaseTextStyle.button1(color: BaseColor.primaryColor)),
    //                 TextSpan(
    //                   text: S.current.txt_no_support,
    //                 )
    //               ]),
    //             ),
    //             imgPath: ImagePath.unSupportVersion,
    //             buttonTitle: S.current.btn_update,
    //             subtitle: S.current.txt_update_version,
    //             title: S.current.txt_no_support,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
