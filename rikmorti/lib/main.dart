import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rikmorti/data/repositories/dioSettings.dart';
import 'package:rikmorti/data/repositories/get_chars_repo.dart';
import 'package:rikmorti/presentation/blocs/chars_bloc/chars_bloc.dart';
import 'package:rikmorti/presentation/screens/splash_screen.dart';
import 'package:rikmorti/presentation/theme/themeProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return TextFieldUnfocus(
          child: MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (context) => DioSettings(),
              ),
              RepositoryProvider(
                create: (context) => GetCharsRepo(dio: RepositoryProvider.of<DioSettings>(context).dio,),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CharsBloc(repo: RepositoryProvider.of<GetCharsRepo>(context),),
                ),
              ],
              child: MaterialApp(
                theme: context.watch<ThemeProvider>().theme,
                home: const SplashScreen(),
              ),
            ),
          ),
        );
      }),
    );
  }
}


class TextFieldUnfocus extends StatelessWidget {
  const TextFieldUnfocus({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: child,
      );
}
