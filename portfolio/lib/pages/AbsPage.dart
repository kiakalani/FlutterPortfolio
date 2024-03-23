import 'package:flutter/material.dart';

abstract class AbsPage extends StatelessWidget {
  final String page;
  const AbsPage({super.key, required this.page});

  List<Widget> pageContents();

  List<Widget> _getNavItems() {
    List<Widget> items = [
      IconButton(
          onPressed: () {},
          icon: const Image(image: AssetImage('assets/icon.png'))),
      const Spacer(),
    ];
    for (String text in ['Projects', 'About', 'Contact']) {
      items.add(
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {},
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
      );
    }
    return items;
  }

  Container _createNavBar() {
    return Container(
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 77, 77, 77),
            Colors.transparent,
            Color.fromARGB(255, 77, 77, 77),
            Colors.transparent,
            Color.fromARGB(255, 77, 77, 77),
          ]),
          borderRadius: BorderRadius.circular((150))),
      child: Row(
        children: _getNavItems(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[_createNavBar()] + pageContents(),
      ),
    );
  }
}
