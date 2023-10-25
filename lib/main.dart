// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/resources/res.dart';
import 'package:flutter_challenge/src/base/routing/routes.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stack_trace/stack_trace.dart';

//Main entry point
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Main run app
  //If it's not on web, and it's android, we enable a high-refresh mode (on iOS is automatically supported by the os)
  if (!kIsWeb) {
    if (Platform.isAndroid) {
      FlutterDisplayMode.setHighRefreshRate();
    }
  }
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  //Set orientation and run app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (value) => runApp(
      const ProviderScope(
        child: App(),
      ),
    ),
  );
}

//Main App Widget
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale.fromSubtags(languageCode: 'it'), // generic italian
        Locale.fromSubtags(languageCode: 'en') // generic english
      ],
      title: "Flutter challenge",

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
    );
  }
}
