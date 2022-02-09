import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';

class NewWfPage extends StatefulWidget {
  const NewWfPage({Key? key}) : super(key: key);
  static const String id = 'new_wf_page';

  @override
  _NewWfPageState createState() => _NewWfPageState();
}

class _NewWfPageState extends State<NewWfPage> {
  List<WifiNetwork> _listWifi = [];
  bool _isEnabled = false;
  bool _isConnected = false;
  String ssid = "";

  void initState() {
    super.initState();
    getWifi();
  }

  Future<void> getWifi() async {
    setState(() async {
      _isEnabled = await WiFiForIoTPlugin.isEnabled();
      _isConnected = await WiFiForIoTPlugin.isConnected();
      _listWifi = await loadWifi();
    });
    setState(() async {
      if (_isConnected) {
        await WiFiForIoTPlugin.getSSID().then((value) {
          ssid = value ?? "";
        });
      }
    });
  }

  Future<List<WifiNetwork>> loadWifi() async {
    List<WifiNetwork> list;
    try {
      list = await WiFiForIoTPlugin.loadWifiList();
    } on PlatformException {
      list = <WifiNetwork>[];
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {

    WiFiForIoTPlugin.isEnabled().then((value){
      setState(() {
        _isEnabled = value;
      });
    });

    WiFiForIoTPlugin.isConnected().then((value){
      setState(() {
        _isConnected = value;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Wifi Page'),
        centerTitle: true,
        backgroundColor: _isEnabled ? Colors.greenAccent : Colors.blue,
        actions: [
          CupertinoSwitch(
            value: _isEnabled,
            onChanged: (value){
              if (_isEnabled) {
                WiFiForIoTPlugin.setEnabled(false);
              } else {
                WiFiForIoTPlugin.setEnabled(true);
                getWifi();
              }
              _isEnabled = !_isEnabled;
              // setState(() {
              //
              // });
            },
          ),
        ],
      ),
      body: _isEnabled
          ? ListView.builder(
              itemCount: _listWifi.length,
              itemBuilder: (context, index) {
                return itrmOfList(index);
              },
            )
          : Center(
              child: Text('No connecting Wi-Fi your mobile'),
            ),
    );
  }

  Widget itrmOfList(int index) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        title: Text(_listWifi[index].ssid ?? 'no data'),
        leading: Icon(Icons.wifi),
      ),
    );
  }
}
