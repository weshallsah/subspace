import 'package:flutter/material.dart';
import 'package:subspace/component/Error.dart';
import 'package:subspace/Home/UI/HomeLoaded.dart';
import 'package:subspace/component/Loading.dart';
import 'package:subspace/Home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace/Detail/UI/detailpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HometoDetailState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(state.blog),
            ),
          );
        }
      },
      builder: (context, state) {
        // print(state);
        switch (state) {
          case HomeLoadedstate():
            return HomeLoaded(state, homeBloc);
          case HomeLoadingstate():
            return LoadingScreen();
          default:
            return ErrorScreen();
        }
      },
    );
  }
}
