//
//
// import 'package:flutter/material.dart';
//
// class PdfView extends StatefulWidget {
//   const PdfView({Key? key}) : super(key: key);
//
//   @override
//   State<PdfView> createState() => _PdfViewState();
// }
//
// class _PdfViewState extends State<PdfView> {
//   @override
//   Widget build(BuildContext context) {
//     final name = basename(widget.file.path);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await saveFile(widget.url, "sample.pdf");
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text(
//                     'success',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             },
//             icon: const Icon(Icons.download_rounded),
//           ),
//         ],
//       ),
//       body: PDFView(
//         filePath: widget.file.path,
//       ),
//     );
//   }
//
//
//
//   // Future<bool> saveFile(String url, String fileName) async {
//   //   try {
//   //     if (await _requestPermission(Permission.storage)) {
//   //       Directory? directory;
//   //       directory = await getExternalStorageDirectory();
//   //       String newPath = "";
//   //       List<String> paths = directory!.path.split("/");
//   //       for (int x = 1; x < paths.length; x++) {
//   //         String folder = paths[x];
//   //         if (folder != "Android") {
//   //           newPath += "/" + folder;
//   //         } else {
//   //           break;
//   //         }
//   //       }
//   //       newPath = newPath + "/PDF_Download";
//   //       directory = Directory(newPath);
//   //
//   //       File saveFile = File(directory.path + "/$fileName");
//   //       if (kDebugMode) {
//   //         print(saveFile.path);
//   //       }
//   //       if (!await directory.exists()) {
//   //         await directory.create(recursive: true);
//   //       }
//   //       if (await directory.exists()) {
//   //         await Dio().download(
//   //           url,
//   //           saveFile.path,
//   //         );
//   //       }
//   //     }
//   //     return true;
//   //   } catch (e) {
//   //     return false;
//   //   }
//   // }
//
//
