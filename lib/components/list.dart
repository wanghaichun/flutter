import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class List extends StatefulWidget {

  @override
  ListState createState() => new ListState();
} 

class ListState extends State<List> {
  var data;

 _getData() async {
   Dio dio = new Dio();
   Response result;
   
   try {
      ///发起请求
      ///url地址，请求数据，一般为Map或者FormData
      ///options 额外配置，可以配置超时，头部，请求类型，数据响应类型，host等
      result = await dio.get("https://jsonplaceholder.typicode.com/posts");
      // print(result.data);
    } on DioError catch (e) {
     print (e);
      ///http错误是通过 DioError 的catch返回的一个对象
    }
    setState(() {
      data = result.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return new ListView.builder(
      itemCount: data == null ? 0 :data.length,
      itemBuilder: (BuildContext context, int index){
        return new Card(
          child: new Container(
            padding: new EdgeInsets.all(10.0),
            child: new ListTile(
              subtitle: new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(data[index]["title"],
                        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text("时间："),
                            new Text("2019-01-15 16:43"),
                          ],
                        )
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 2.0),
                          child: new Text("id:" + data[index]["id"].toString()),
                        )
                      ],
                    )
                  ],
                ),
              ),
              trailing: new Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            ),
          ),
        );
      }
    );
  }
}
