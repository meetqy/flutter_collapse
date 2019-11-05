/*
 * @Author: meetqy
 * @since: 2019-10-22 09:59:58
 * @lastTime: 2019-11-05 17:51:08
 * @LastEditors: meetqy
 */
import 'package:flutter/material.dart';
import 'package:flutter_collapse/flutter_collapse.dart';

class ExampleCollapse extends StatefulWidget {
  ExampleCollapse({Key key}) : super(key: key);

  @override
  _ExampleCollapseState createState() => _ExampleCollapseState();
}

class _ExampleCollapseState extends State<ExampleCollapse> {
  bool status1 = true;
  bool status2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: Text('collapse'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Collapse(
                title: Container(
                  child: Text('折叠面板 - 默认')
                ),
                body: Text('这就是一个demo'),
                value: status1,
                onChange: (bool value) {
                  setState(() {
                    status1 = value;
                  });
                },
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Collapse(
                  padding: EdgeInsets.all(0),
                  title: Text('折叠面板 - 自定义'),
                  body: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('这就是一个demo这就是一个demo这就是一个demo这就是一个demo这就是一个demo'),
                        Text('这就是一个demo这就是一个demo这就是一个demo'),
                        Text('这就是一个demo这就是一个demo'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircularProgressIndicator(
                              backgroundColor: Colors.yellow,
                            ),
                            CircularProgressIndicator(
                              backgroundColor: Colors.green,
                            ),
                            CircularProgressIndicator(
                              backgroundColor: Colors.red,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  value: status2,
                  onChange: (bool value) {
                    setState(() {
                      status2 = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
