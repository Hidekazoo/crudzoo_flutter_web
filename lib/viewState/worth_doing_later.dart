

import 'package:crudzoo_flutter_web/api/worth_doing_later.dart';
import 'package:crudzoo_flutter_web/components/ListItem.dart';
import 'package:flutter/material.dart';

class WorthDoingLater extends StatefulWidget {
  const WorthDoingLater({super.key});

  @override
  State<StatefulWidget> createState() {
    return WorthDoingLaterState();
  }


}

class WorthDoingLaterState extends State<WorthDoingLater> {

  late Future<List<WorthDoingLaterResponse>> worthDoingLaterResponse;

  @override
  void initState() {
    super.initState();
    worthDoingLaterResponse = fetchWorthDoingLater();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: worthDoingLaterResponse,
        builder: (context,snapshot) {
      if (snapshot.hasData) {
        return ListItem(items: snapshot.data!.map((e) => Item(title: e.title, link: e.link, supplement: e.supplement)).toList());
      }
      return const CircularProgressIndicator();
    });
  }

}