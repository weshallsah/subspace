import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:subspace/Model/Blog.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeLoadingstate());
      try {
        const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
        const String adminSecret =
            '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
        final res = await http.get(
          Uri.parse(url),
          headers: {
            'x-hasura-admin-secret': adminSecret,
          },
        );
        if (res.statusCode != 200) {
          throw "something went wrong";
        }
        final response = json.decode(res.body);
        List<Blog> blogs = [];
        for (var blog in response['blogs']) {
          blogs.add(Blog(blog['id'], blog['title'], blog['image_url']));
        }
        emit(HomeLoadedstate(blogs));
      } catch (e) {
        print(e);
        emit(HomeErrorstate());
      }
    });
    on<HomeNavEvent>(
      (event, emit) {
        emit(HometoDetailState(event.blog));
      },
    );
  }
}
