import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace/DB/DateBase.dart';
import 'package:subspace/Detail/UI/LoadedScreen.dart';
import 'package:subspace/Detail/bloc/details_bloc.dart';
import 'package:subspace/Model/Blog.dart';
import 'package:subspace/component/Error.dart';
import 'package:subspace/component/Loading.dart';

class DetailScreen extends StatefulWidget {
  Blog blog;
  VoidCallback cliecked;
  DetailScreen(this.blog, this.cliecked, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
            widget.cliecked();
            widget.blog.isfav = !widget.blog.isfav;
            if (widget.blog.isfav) {
              DataBase().Addfav(widget.blog.id, 1);
            } else {
              DataBase().Addfav(widget.blog.id, 0);
            }
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
            return LoadedScreen(widget.blog, detailsBloc);
          case DetailLoadingState():
            return LoadingScreen();
          default:
            return ErrorScreen();
        }
      },
    );
  }
}
