import 'dart:io';

class Blog {
  String title;
  String url;
  String id;
  File? image = null;
  bool isfav;
  Blog(
    this.id,
    this.title,
    this.url,
    this.image,
    this.isfav,
  );
}
