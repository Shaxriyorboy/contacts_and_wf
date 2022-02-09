import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HorizScroll extends StatefulWidget {
  const HorizScroll({Key? key}) : super(key: key);
  static const String id = 'horiz_scroll';

  @override
  _HorizScrollState createState() => _HorizScrollState();
}

class _HorizScrollState extends State<HorizScroll> {

  List<Obect> obectList = [
    Obect('Shaxriyor', '+998997099958'),
    Obect('Sardor aka', '+998991234258'),
    Obect('Fayoz', '+998997918258'),
    Obect('Nurilloh', '+998936518258'),
    Obect('Abdulloh', '+998997918258'),
    Obect('Javlon aka', '+998993458258'),
    Obect('Odbidjon aka', '+998995568258'),
    Obect('Dilshod aka', '+998901266742'),
    Obect('Dilshod aka', '+998901266742'),
    Obect('Dilshod aka', '+998901266742'),
    Obect('Dilshod aka', '+998901266742'),
    Obect('Shaxriyor', '+998997099958'),
    Obect('Sardor aka', '+998991234258'),
    Obect('Fayoz', '+998997918258'),
    Obect('Nurilloh', '+998936518258'),
    Obect('Abdulloh', '+998997918258'),
    Obect('Javlon aka', '+998993458258'),
    Obect('Odbidjon aka', '+998995568258'),
    Obect('Dilshod aka', '+998901266742'),
    Obect('Dilshod aka', '+998901266742'),
    Obect('Dilshod aka', '+998901266742'),
    Obect('Dilshod aka', '+998901266742'),
  ];

  List colors = [
    Colors.blue.shade400,
    Colors.amber,
    Colors.blue.shade800,
    Colors.green,
    Colors.blue.shade400,
    Colors.amber,
    Colors.orange.shade800,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.blue.shade400,
    Colors.amber,
    Colors.blue.shade800,
    Colors.green,
    Colors.blue.shade400,
    Colors.amber,
    Colors.orange.shade800,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // _allStorys(),
              // itemBUilder(),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for(int i=0;i<obectList.length;i++) _itomStorys(obectList[i].name.toString()[0],obectList[i].name.toString(),colors[i],obectList[i].number.toString()),
                  ],
                ),
              ),
              for(int i=0;i<obectList.length;i++) itemList(obectList[i].name.toString(),obectList[i].number.toString(),colors[i],obectList[i].name.toString()[0]),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemList(String name,String number,Color colr,String fullName) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          child: MaterialButton(
            onPressed: (){},
            color: colr,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(fullName,style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
        ),
        title: Text(name),
        subtitle: Text(number),
        trailing: IconButton(
          onPressed: () => launch('tel:+${number}'),
          icon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget itemBUilder(){
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: obectList.length,
        itemBuilder: (context, int index) {
          return itemList(obectList[index].name.toString(),obectList[index].number.toString(),colors[index],obectList[index].name.toString()[0]);
        },
      ),
    );
  }

  Widget _itomStorys(String name,String fullName, Color colr,String number) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(left: 20),
          child: MaterialButton(
            onPressed: () => launch('tel:+${number}'),
            color: colr,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(name,style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20),
            child: Text(
              fullName,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _allStorys() {
    return Container(
      height: 100,
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: obectList.length,
          itemBuilder: (BuildContext context, int index) {
            return _itomStorys(obectList[index].name.toString()[0],obectList[index].name.toString(),colors[index],obectList[index].number.toString());
          },
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