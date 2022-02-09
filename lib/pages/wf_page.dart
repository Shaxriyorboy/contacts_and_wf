import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
// import 'package:url_launcher/url_launcher.dart';

class WfPage extends StatefulWidget {
  const WfPage({Key? key}) : super(key: key);
  static const String id = 'wf_page';

  @override
  _WfPageState createState() => _WfPageState();
}

class _WfPageState extends State<WfPage> {
  bool status = false;

  List<Obect> obectList = [
    Obect('Alibaba'),
    Obect('Ebay'),
    Obect('Cisco'),
    Obect('Microsoft'),
    Obect('Google'),
    Obect('Tesla'),
    Obect('Uber'),
    Obect('Alibaba'),
    Obect('Ebay'),
    Obect('Cisco'),
    Obect('Tesla'),
    Obect('Uber'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          elevation: 0,
          backgroundColor: Colors.grey.shade400,
          title: Text('Wi-Fi',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: FlutterSwitch(
                width: 60.0,
                height: 32.0,
                value: status,
                borderRadius: 20.0,
                padding: 8.0,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ),
          ],
        ),
        body: status?Container(
          child: ListView.builder(
            itemCount: obectList.length,
            itemBuilder:(BuildContext context, int index){
              return itemList(
                obectList[index].name.toString(),
              );
            },
          ),
        ):SizedBox.shrink(),
      ),
    );
  }

  Widget itemList(String name) {
    return Card(
      elevation: 100,
      margin: EdgeInsets.only(left: 20,right: 20,top: 10),
      child: ListTile(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.wifi),
        ),
        title: Text(name),
        trailing: Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {},
                icon: Icon(Icons.lock),
              ),
              IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {},
                icon: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Obect {
  String? name;
  Obect(this.name);
}
