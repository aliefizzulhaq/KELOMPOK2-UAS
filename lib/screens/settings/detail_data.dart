import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';
import 'edit_data.dart';

class DetailData extends StatefulWidget {
  //const DetailData({ Key? key }) : super(key: key);
  List list;
  int index;
  DetailData({required this.index, required this.list});

  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  void DeleteData() {
    var url = "https://sofieboutique.000webhostapp.com/deletenews.php";
    http.post(Uri.parse(url), 
    body: {"id": widget.list[widget.index]['id']});
    Fluttertoast.showToast(
        msg: "Produk" +
            widget.list[widget.index]["title"] +
            "Data Produk Berhasil Dihapus",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text ("Apakah anda yakin ingin menghapus produk : '${widget.list[widget.index]['title']}'"),
      actions: <Widget>[
        new MaterialButton(
          child: new Text ("Hapus", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            DeleteData();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new Launcher()),
            );
          },), 

          new MaterialButton(
            child: new Text("Batal",style : new TextStyle(color: Colors.black)),
            color: Colors.green,
            onPressed: ()=>Navigator.pop(context),),
      ],
    );
    showDialog(context: context, builder: (context)=>alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: new Text("${widget.list[widget.index]['title']}"),),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: new Center(
            child: new Column(
               children: <Widget>[
                 new Padding(padding: const EdgeInsets.only(top: 20.0)),
                 new Text("${widget.list[widget.index]['title']}", style: new TextStyle(fontSize: 20.0),),

                 new Padding(padding: const EdgeInsets.only(top: 20.0)),
                 new Image.network("${widget.list[widget.index]['img_url']}"),

                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                 new Text("${widget.list[widget.index]['content']}", style: new TextStyle(fontSize: 15.0),),

                 new Padding(padding: const EdgeInsets.only(top: 20.0)),
                 new Text("${widget.list[widget.index]['harga']}", style: new TextStyle(fontSize: 20.0),),

                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new MaterialButton(
                      child: new Text("Edit"),
                      color: Colors.green,
                      onPressed:()=>Navigator.of(context).push(new MaterialPageRoute(
              builder:(BuildContext context)=>
              new Edit_Data(list: widget.list, index: widget.index))),
                    ),

                      new MaterialButton(
                      child: new Text("Hapus"),
                      color: Colors.red,
                      onPressed:()=>confirm(),),
                  ],
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
               ],
            ),
          ),
        ),
      ),

    );
  }
}
