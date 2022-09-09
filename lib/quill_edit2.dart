import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:get/get.dart';
import 'getxcont.dart';

class Editor2 extends StatefulWidget {

  @override

  State<Editor2> createState() => _EditorState2();
}

class _EditorState2 extends State<Editor2> {
  QuillController _controller = QuillController.basic();
  final controllerx = Get.put(getxcontroller());
  var doc = new Delta();
  var json;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //json = jsonDecode(doc.toString());
    _controller.addListener(() {
      double n= (MediaQuery.of(context).size.width)/9.1;  //normal size일경우

      doc = _controller.document.toDelta();
      json = jsonDecode(jsonEncode(doc.toJson()));
      //controllerx.height.value = controllerx.cal_width(json,MediaQuery.of(context).size.width).round();
      controllerx.height.value = '\n'.allMatches(json.toString()).length;


      // controllerx.count.value = _controller.document.toPlainText().split('\n').length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print(json);
              //print('${MediaQuery.of(context).size.width/9.1}');
              controllerx.cal_width(json,MediaQuery.of(context).size.width);
              //print('${controllerx.cal_width(json,MediaQuery.of(context).size.width)}');
              //print('${controllerx.cal_width(json).round()}');
            },
          ),
        ],
      ),
      body:  Container(
        color: Colors.red,
        child: GetX<getxcontroller>(
                builder: (_) {
                  return Container(
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(20, 20, 20,
                          ((300- controllerx.height.value*20)>20)?(300- controllerx.height.value*20):20),
                      child: Column(
                          children: [
                            QuillToolbar.basic(controller: _controller),
                            Flexible(
                              child: Container(
                                child: QuillEditor.basic(
                                  controller: _controller,
                                  readOnly: false, // true for view only mode

                                ),
                              ),
                            ),
                          ]
                      ),
                    );
                },
              )
      ),
    );
  }
}


