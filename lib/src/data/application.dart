import 'package:flutter/cupertino.dart';
import 'package:phone_book/src/data/contact_service.dart';

class ApplicationState extends ChangeNotifier {
  final contactService = ContactService.create();
  ApplicationState() {
    init();
  }

  Future<void> init() async {}
}
