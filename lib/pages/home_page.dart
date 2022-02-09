import 'package:contacts_and_wf/pages/contacts_page.dart';
import 'package:contacts_and_wf/pages/horiz_scroll_page.dart';
import 'package:contacts_and_wf/pages/scroll_contact.dart';
import 'package:contacts_and_wf/pages/wf_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 150,
              height: 40,
              color: Colors.blue,
              child: Text("Open Wifi"),
              onPressed: () {
                Navigator.of(context).pushNamed(WfPage.id);
              },
            ),
            MaterialButton(
              minWidth: 150,
              height: 40,
              color: Colors.blue,
              child: Text("Open Contact"),
              onPressed: () {
                Navigator.of(context).pushNamed(ContactPage.id);
              },
            ),
            MaterialButton(
              minWidth: 150,
              height: 40,
              color: Colors.blue,
              child: Text("Open Scroll Contact"),
              onPressed: () {
                Navigator.of(context).pushNamed(ScrollContact.id);
              },
            ),
            MaterialButton(
              minWidth: 150,
              height: 40,
              color: Colors.blue,
              child: Text("Open Horiz Scroll"),
              onPressed: () {
                Navigator.of(context).pushNamed(HorizScroll.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
