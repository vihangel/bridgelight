import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/bloc_initialize.dart';
import 'package:mybookstore/core/utils/theme.dart';
import 'package:mybookstore/generated/l10n.dart';

class PlataformApp extends StatefulWidget {
  const PlataformApp({super.key});

  @override
  State<PlataformApp> createState() => _PlataformAppState();
}

class _PlataformAppState extends State<PlataformApp>
    with WidgetsBindingObserver, BlocInitialize {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: blocs,
      child: MaterialApp.router(
        title: 'MyBookStore',
        theme: MyBookStoreTheme.light(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
          Locale('en', 'US'),
        ],
        // initialRoute: '/',
        // navigatorKey: Modular.navigatorKey,
        // onGenerateRoute: Modular.generateRoute,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        locale: const Locale('pt', 'BR'),
      ),
    );
  }
}
