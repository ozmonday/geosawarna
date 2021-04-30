import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  const ContactItem({Key key, this.contact}) : super(key: key);

  Future<void> launcer(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "can't lauch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      contact.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    contact.phone,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              final Uri url = Uri(scheme: "sms", path: contact.phone);
              launch(url.toString());
            },
            child: Container(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 14),
              child: Image.asset("assets/email.png", width: 20),
            ),
          ),
          GestureDetector(
            onTap: () {
              final Uri url = Uri(scheme: "tel", path: contact.phone);
              launch(url.toString());
            },
            child: Container(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 14),
              child: Image.asset("assets/phone-call.png", width: 20),
            ),
          )
        ]),
      ),
    );
  }
}
