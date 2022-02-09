import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);
  static const String id = 'contact_page';

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  List<Obect> obectList = [
    Obect('Shaxriyor', '+998997099958'),
    Obect('Sardor aka', '+998991234258'),
    Obect('Fayoz', '+998997918258'),
    Obect('Nurilloh', '+998936518258'),
    Obect('Abdulloh', '+998997918258'),
    Obect('Javlon aka', '+998993458258'),
    Obect('Odbidjon aka', '+998995568258'),
  ];

  List images = [
    'assets/images/img_1.png',
    'assets/images/img_2.png',
    'assets/images/img_3.png',
    'assets/images/img_4.png',
    'assets/images/img_5.png',
    'assets/images/img_6.png',
    'assets/images/img_7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Center(
            child: Text('Contacts'),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),),
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: obectList.length,
            itemBuilder: (BuildContext context, int index) {
              return itemList(obectList[index].name.toString(),obectList[index].number.toString(),images[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget itemList(String name,String number,String image) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(image: AssetImage(image),width: 50,height: 50,fit: BoxFit.cover,),
        ),
        hoverColor: Colors.grey,
        title: Text(name),
        subtitle: Text(number),
        trailing: IconButton(
          onPressed: () => launch('tel:+${number}'),
          icon: Icon(Icons.phone),
        ),
      ),
    );
  }
}

class Obect{
  String? name;
  String? number;
  Obect(this.name,this.number);
}
