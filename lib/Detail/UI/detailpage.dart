import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace/Detail/UI/ErrorScreen.dart';
import 'package:subspace/Detail/UI/LoadedScreen.dart';
import 'package:subspace/Detail/UI/LoadingScreen.dart';
import 'package:subspace/Detail/bloc/details_bloc.dart';
import 'package:subspace/Model/Blog.dart';

class DetailScreen extends StatefulWidget {
  Blog blog;
  DetailScreen(this.blog, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isfav = false;
  final DetailsBloc detailsBloc = DetailsBloc();
  @override
  void initState() {
    super.initState();
    detailsBloc.add(DetailInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      bloc: detailsBloc,
      buildWhen: (previous, current) => current is! DetailActionState,
      listenWhen: (previous, current) => current is DetailActionState,
      listener: (context, state) {
        switch (state) {
          case FavButtonClikedState():
            isfav = !isfav;
            break;
          case TiwterButtonClikedState():
            print("tiwtter");
            break;
          case InstagramButtonClikedState():
            print("instagram");
            break;
          case FacebookButtonClikedState():
            print("FaceBook");
            break;
          default:
            print("defualt");
        }
        if (mounted) {
          setState(() {});
        }
      },
      builder: (context, state) {
        switch (state) {
          case DetailLoadedState():
            return LoadedScreen(widget.blog, detailsBloc, isfav);
          case DetailLoadingState():
            return LoadingScreen();
          default:
            return ErrorScreen();
        }
      },
    );
  }
}
