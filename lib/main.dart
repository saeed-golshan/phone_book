import 'package:flutter/material.dart';
import 'package:phone_book/src/data/contact_service.dart';
import 'package:phone_book/src/view/contact_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ContactService.create(),
      dispose: (context, ContactService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Material App',
        home: ContatcListPage(),
      ),
    );
  }
}
