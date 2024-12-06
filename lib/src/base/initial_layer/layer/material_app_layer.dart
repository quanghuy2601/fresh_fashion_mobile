import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/generated/l10n.dart';
import 'package:fresh_fashion_mobile/src/base/validation_layer/layer/validation_layer.dart';
import 'package:fresh_fashion_mobile/src/common/utils/constants/global_key.dart';

class MaterialAppLayer extends StatelessWidget {
  const MaterialAppLayer({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute,
        initialRoute: RoutePath.root,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: locale,
        home: const ValidationLayer(),
      ),
    );
  }
}
