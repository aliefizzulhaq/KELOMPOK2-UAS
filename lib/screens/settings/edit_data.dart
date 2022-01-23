import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';

class Edit_Data extends StatefulWidget {
  //const Edit_Data({ Key? key }) : super(key: key);
  final List list;
  final int index;
  Edit_Data({required this.list, required this.index});

  @override
  _Edit_DataState createState() => _Edit_DataState();
}

class _Edit_DataState extends State<Edit_Data> {
  TextEditingController controllerTitle = new TextEditingController();
  TextEditingController controllerContent = new TextEditingController();
  TextEditingController controllerHarga= new TextEditingController();
  TextEditingController controllerUrlImg = new TextEditingController();
  void editData(){
    var url = "https://sofieboutique.000webhostapp.com/editnews.php";
    http.post(Uri.parse(url), body: {
     "id" : widget.list[widget.index]['id'],
     "title" : controllerTitle.text,
     "content" : controllerContent.text,
     "harga" : controllerHarga.text,
     "img_url" : controllerUrlImg.text
    });
  }

  @override
  void initState(){
    controllerTitle = new TextEditingController(
      text: widget.list[widget.index]['title']
    );
    controllerContent = new TextEditingController(
      text: widget.list[widget.index]['content']
    );
    controllerHarga = new TextEditingController(
      text: widget.list[widget.index]['harga']
    );
    controllerUrlImg = new TextEditingController(
      text: widget.list[widget.index]['img_url']
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new TextField(
              controller: controllerTitle,
              decoration: new InputDecoration(
                hintText: "Isi Nama Produk Disini",labelText: "Nama Produk"),
              ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new TextField(
              controller: controllerUrlImg,
              decoration: new InputDecoration(
                hintText: "Isi Url Image Disini",labelText: "Link Url Image"),
               ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new TextField(
              controller: controllerContent,
              decoration: new InputDecoration(
                hintText: "Isi Deskripsi Disini",labelText: "Deskripsi Produk"),
               ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new TextField(
              controller: controllerHarga,
              decoration: new InputDecoration(
                hintText: "Isi Harga Produk Disini",labelText: "Harga Produk"),
               ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              MaterialButton(
                child: new Text("Edit Data"),
                color: Colors.blueAccent,
                onPressed: (){editData();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=> new Launcher()),);}),

          ],
        ),
      ),
      
    );
  }
}