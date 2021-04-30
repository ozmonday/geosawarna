import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactProvider with ChangeNotifier {
  List<Contact> _contacts = [
    Contact(name: "sample-1", phone: "085678974567"),
    Contact(name: "sample-2", phone: "086723343467"),
    Contact(name: "sample-3", phone: "873253425435")
  ];

  List<Contact> get contacts => _contacts;
}
