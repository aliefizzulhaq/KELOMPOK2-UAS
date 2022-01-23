import 'dart:io';

import 'package:ecommerce_int2/app_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegalAboutPage extends StatefulWidget {
  @override
  _LegalAboutPageState createState() => _LegalAboutPageState();
}

class _LegalAboutPageState extends State<LegalAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black,
          ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Pengaturan',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top:24.0,left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Tentang legalitas',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Syarat penggunaan'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Kebijakan Privasi'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Lisensi'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Aturan Penjual'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Aturan Pengembalian'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
