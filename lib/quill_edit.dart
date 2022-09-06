// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import 'package:get/get.dart';
//
// import 'getxcont.dart';
//
// class Editor extends StatefulWidget {
//
//   @override
//
//   State<Editor> createState() => _EditorState();
// }
//
// class _EditorState extends State<Editor> {
//   QuillController _controller = QuillController.basic();
//   final controllerx = Get.put(getxcontroller());
//   int h = 300;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               print(_controller.document.toPlainText().length);
//               setState(() {
//                 controllerx.count.value = _controller.document.toPlainText().length;
//               });
//             },
//           ),
//         ],
//       ),
//       body:  Container(
//         color: Colors.red,
//         child: Container(
//           child: GetX<getxcontroller>(
//               builder: (_) {
//                 controllerx.count.value = _controller.document.toPlainText().length;
//                 return Container(
//                   color: Colors.white,
//                   margin: EdgeInsets.fromLTRB(20, 20, 20,
//                       (controllerx.count.value<20)? 250:200),
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                   child: Column(
//               children: [
//                   QuillToolbar.basic(controller: _controller),
//                   Expanded(
//                         child: Container(
//                           child: QuillEditor.basic(
//                             controller: _controller,
//                             readOnly: false, // true for view only mode
//
//                           ),
//                         ),
//                       ),
//                   ]
//                   ),
//                 );
//               },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
