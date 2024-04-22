import 'dart:async';

import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';

class FileDownloadDemo extends StatefulWidget {
  const FileDownloadDemo({super.key});

  @override
  State<FileDownloadDemo> createState() => _FileDownloadDemoState();
}

class _FileDownloadDemoState extends State<FileDownloadDemo> {
  int progress = 0;
  late StreamSubscription progressStream;
  String filePDFUrl =
      'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';
  String fileImage =
      'https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?auto=compress&cs=tinysrgb&w=600';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        setState(() {
          progress = event.progress;
        });
        FlDownloader.openFile(filePath: event.filePath);
      } else if (event.status == DownloadStatus.running) {
        setState(() {
          progress = event.progress;
        });
      } else if (event.status == DownloadStatus.failed) {
        //do some operation
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    progressStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download File'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Progress $progress',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () async {
                final permission = await FlDownloader.requestPermission();
                if (permission == StoragePermissionStatus.granted) {
                  await FlDownloader.download(filePDFUrl, fileName: 'Demo.pdf');
                }
              },
              child: const Text('Download'))
        ],
      ),
    );
  }
}
