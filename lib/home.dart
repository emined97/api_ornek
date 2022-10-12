import 'dart:io';

import 'package:api_ornek/post_comments.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<PostComments> _items;
  @override
  @override
  void initState() {
    super.initState();
    getComments();
  }

  Future<void> getComments() async {
    final baglanti = await Dio()
        .get('https://jsonplaceholder.typicode.com/posts/1/comments');

    if (baglanti.statusCode == HttpStatus.ok) {
      final veri = baglanti.data;
      if (veri is List) {
        setState(() {
          _items = veri.map((e) => PostComments.fromJson(e)).toList();
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
