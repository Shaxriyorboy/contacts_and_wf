import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScrollContact extends StatefulWidget {
  const ScrollContact({Key? key}) : super(key: key);
  static const String id = 'scroll_contact';

  @override
  _ScrollContactState createState() => _ScrollContactState();
}

class _ScrollContactState extends State<ScrollContact> {
  Iterable<Contact> _contacts = [];
  List<Color> colors = Colors.accents;

  List myList = [];
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    getContacts();
    super.initState();
    myList = List.generate(10, (index) => itemList(index));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
  }

  Future<void> getContacts() async {
    Iterable<Contact> contact = await ContactsService.getContacts();
    setState(() {
      _contacts = contact.where((element) => element.phones!.isNotEmpty);
    });
  }

  getMoreData() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      if (i == myList.length) {
        break;
      } else {
        myList.add(itemList(i));
      }
    }
    if (myList.length - _currentMax < 10) {
      _currentMax = _contacts.length;
    } else {
      _currentMax = _currentMax + 10;
    }
    setState(() {});
  }

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
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: Column(
          children: [
            _allStorys(),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _contacts.length,
                // itemExtent: 10,
                itemBuilder: (context, int index) {
                  return itemList(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemList(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colors[index%16],
          minRadius: 40,
          maxRadius: 40,
          child: Text(
            _contacts.elementAt(index).initials(),
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        hoverColor: Colors.grey,
        title: Text(_contacts.elementAt(index).displayName?? 'No name'),
        subtitle: Text(_contacts.elementAt(index).phones!.first.value.toString()),
        trailing: IconButton(
          onPressed: () =>
              launch('tel:+${_contacts.elementAt(index).phones!.first.value}'),
          icon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _itomStorys(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(left: 20),
          child: MaterialButton(
            onPressed: () =>
                launch('tel:+${_contacts.elementAt(index).phones!.first.value}'),
            color: colors[index],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              _contacts.elementAt(index).initials(),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Flexible(
          child: Text(
            _contacts.elementAt(index).displayName ?? "No name",
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }

  Widget _allStorys() {
    return SizedBox(
      height: 100,
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _contacts.length,
          itemBuilder: (context, int index) {
            return _itomStorys(index);
          },
        ),
      ),
    );
  }
}

class Obect {
  String? name;
  String? number;

  Obect(this.name, this.number);
}
