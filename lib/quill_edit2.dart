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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      controllerx.count.value= _controller.document.toPlainText().split('\n').length;
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
              print(_controller.document.toPlainText().length);
              // setState(() {
              //   controllerx.count.value = _controller.document.toPlainText().length;
              // });
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
                        300-controllerx.count.value*20),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                        children: [
                          QuillToolbar.basic(controller: _controller),
                          Expanded(
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

