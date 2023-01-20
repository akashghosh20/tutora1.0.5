import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Tutora/pages/student/PDF/class6/Islam/IslamDocument.dart';
import 'package:Tutora/pages/student/PDF/class6/Islam/IslamReader.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class IslamView extends StatefulWidget {
  @override
  _IslamView createState() => _IslamView();
}

class _IslamView extends State<IslamView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter PDF Viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Recent Documents"),
              Column(
                children: IslamDocument.doc_list
                    .map((doc) => ListTile(
                          onTap: () {
                            Get.to(IslamReader(doc));
                          },
                          leading: Icon(Icons.picture_as_pdf),
                          title: Text(
                            doc.title!,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text("${doc.pageNo} Pages"),
                          trailing: Text(doc.docDate!),
                        ))
                    .toList(),
              ),
            ],
          ),
        )));
  }
}
