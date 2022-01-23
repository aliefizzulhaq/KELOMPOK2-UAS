import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Add_Data extends StatefulWidget {
  // const Add_Data({ Key? key }) : super(key: key);

  @override
  _Add_DataState createState() => _Add_DataState();
}

class _Add_DataState extends State<Add_Data> {
  TextEditingController controllerTitle = new TextEditingController();
  TextEditingController controllerContent = new TextEditingController();
  TextEditingController controllerHarga= new TextEditingController();
  TextEditingController controllerUrlImg = new TextEditingController();
  

  void addData() {
    var url = "https://sofieboutique.000webhostapp.com/addnews.php";
    http.post(Uri.parse(url), body: {
      "title": controllerTitle.text,
      "content": controllerContent.text,
      "harga": controllerHarga.text,
      "img_url": controllerUrlImg.text
    });
    Fluttertoast.showToast(msg: "Data Produk Berhasil Ditambahkan. Cek di Menu utama!",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tambah Data Produk"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.30),
              child: TextField(
                controller: controllerTitle,
                decoration: new InputDecoration(
                    hintText: "isi nama produk disini...", labelText: "Nama Produk"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.30),
              child: TextField(
                controller: controllerContent,
                decoration: new InputDecoration(
                    hintText: "isi deskripsi produk disini...",
                    labelText: "Deskripsi Produk"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.30),
              child: TextField(
                controller: controllerHarga,
                decoration: new InputDecoration(
                    hintText: "isi harga produk disini...",
                    labelText: "Harga Produk"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.30),
              child: TextField(
                controller: controllerUrlImg,
                decoration: new InputDecoration(
                    hintText: "isi URL gambar produk disini...",
                    labelText: "Gambar Produk"),
              ),
            ),
            RaisedButton(
              child: Text("Simpan Data Produk"),
              onPressed: () {addData();},
            )
          ],
        ),
      ),
    );
  }
}
