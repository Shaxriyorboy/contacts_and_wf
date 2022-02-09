import 'package:contacts_and_wf/pages/contacts_page.dart';
import 'package:contacts_and_wf/pages/home_page.dart';
import 'package:contacts_and_wf/pages/horiz_scroll_page.dart';
import 'package:contacts_and_wf/pages/new_wf_page.dart';
import 'package:contacts_and_wf/pages/phone_contact_page.dart';
import 'package:contacts_and_wf/pages/scroll_contact.dart';
import 'package:contacts_and_wf/pages/wf_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        WfPage.id:(context) => WfPage(),
        ContactPage.id:(context)=>ContactPage(),
        ScrollContact.id: (context) => ScrollContact(),
        HorizScroll.id:(context) => HorizScroll(),
        NewWfPage.id:(context) => NewWfPage(),
        PhoneContactPage.id:(context) => PhoneContactPage(),
      },
    );
  }
}

