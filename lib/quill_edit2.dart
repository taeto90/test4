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
      double n= (MediaQuery.of(context).size.width)/9.3;
      controllerx.count.value = _controller.document.toPlainText().split('\n').length;

      int i=1;
      int sum=0;
      while(i<8){
        sum += _controller.document.toPlainText().split('\n').where((f) => f.length>(i*n)).toList().length;
        i++;
      }

      controllerx.index.value=sum;
      //controllerx.index.value = _controller.document.toPlainText().split('\n').where((f) => f.length>n).toList().length;
      // if(_controller.document.toPlainText().split('\n')[controllerx.count.value-1].length>n){
      //   controllerx.index.value = ((_controller.document.toPlainText().split('\n')[controllerx.count.value-1].length)/n).toInt();
      // }
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
              print(_controller.document.toPlainText());
              print( controllerx.count.value);
              print('${MediaQuery.of(context).size.width}');
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
                          300- controllerx.count.value*20 - controllerx.index.value*20),
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


