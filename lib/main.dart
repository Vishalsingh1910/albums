
import 'package:albums/models/post_models.dart';
import 'package:albums/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
         backgroundColor: Colors.orange,
         leading: IconButton(
           icon: const Icon(Icons.arrow_back_ios_new),
           onPressed: () {},
         ),
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(25),
             bottomRight: Radius.circular(25)
           )
         ),
      ),
        body: _body()
      ),
    );
  }
  FutureBuilder _body() {
    final apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder(
    future: apiService.getPosts(),
    builder: (context,snapshot) {
    if(snapshot.connectionState == ConnectionState.done) {
    final List<UserModel> posts = snapshot.data!;
    return _posts(posts);
    } else {
      return const Center(
        child: CircularProgressIndicator()
      );
    }
  },
  );
}
Widget _posts(List<UserModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
        itemBuilder: (context,index) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black38,width: 1),
          ),
          child: Column(
            children: [
              Text(
                posts[index].email
              ),
              const SizedBox(height: 10,),
              Text(posts[index].email
              )
            ],
          ),
        );
        }
    );
}
}
