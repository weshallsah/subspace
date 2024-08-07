import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:subspace/DB/DBname.dart';
import 'package:subspace/Model/Blog.dart';
import 'package:http/http.dart' as http;

class DataBase {
  void insertBlog(Blog blog) async {
    try {
      if (blog.url == "") {
        return;
      }
      final path = await DBname();
      Database db = await openDatabase(path);
      final istable = await db.query("sqlite_master", columns: ['name']);
      bool iscreate = true;
      istable.forEach((element) {
        if (element['name'] == 'blogs') {
          iscreate = false;
        }
      });
      if (iscreate) {
        await db.execute('''
              CREATE TABLE blogs(
                id Text primary key,
                titel Text not null,
                isfav int,
                Image Blob
              )''');
      }
      final res = await http.get(Uri.parse(blog.url));
      Uint8List imageInUnit8List = res.bodyBytes;
      await db.insert('blogs', {
        "id": blog.id,
        "titel": blog.title,
        "Image": imageInUnit8List,
        "isfav": 0
      });
      print("done");
    } catch (e) {
      print("error :- ${e}");
    }
  }

  Future fetchusers() async {
    try {
      List<Blog> blogs = [];
      final path = await DBname();
      Database db = await openDatabase(path);
      final res = await db.query("blogs");
      for (var u in res) {
        File? file;
        if (u['Image'] != "" && u['Image'] != null) {
          final temp = await getTemporaryDirectory();
          file = await File("${temp.path}/${u['id']}.png").create();
          file.writeAsBytesSync(u['Image'] as Uint8List);
        }
        blogs.add(Blog(u['id'].toString(), u['titel'].toString(), "", file,
            u['isfav'] == 0 ? false : true));
      }
      return blogs;
    } catch (err) {
      print("error :- ${err}");
    }
  }

  void Addfav(String id, int fav) async {
    try {
      final path = await DBname();
      Database db = await openDatabase(path);
      int updateCount = await db.rawUpdate('''
        UPDATE blogs 
        SET isfav = ? 
        WHERE id = ?
        ''', [fav, id]);
      print(updateCount);
    } catch (e) {
      print(e);
    }
  }
}
