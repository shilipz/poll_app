import 'package:flutter/material.dart';
import 'package:poll_app/core/constants/constants.dart';
import 'package:poll_app/features/nav_bar_home.dart/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poll_app/features/new_poll/presentation/bloc/newpoll_bloc.dart';
import 'package:poll_app/features/poll_list/domain/functions/functions.dart';
import 'package:poll_app/features/poll_list/presentation/bloc/fetch_poll_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final screenWidth = ScreenSize.screenWidth;
final screenHeight = ScreenSize.screenHeight;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NewpollBloc(context)),
          BlocProvider(create: (context) => FetchPollBloc(FetchPollData()))
        ],
        child: const Home(),
      ),
    );
  }
}
