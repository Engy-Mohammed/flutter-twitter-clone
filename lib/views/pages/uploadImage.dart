import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadVideo(),
    );
  }
}

class UploadVideo extends StatefulWidget {
  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  VideoPlayerController? _controller;
  html.FileUploadInputElement? _fileInput;
  bool _fileSelected = false;

  @override
  void initState() {
    super.initState();
    _fileInput = html.FileUploadInputElement()..accept = 'video/*';
    _fileInput!.onChange.listen((event) {
      final files = _fileInput!.files;
      if (files!.length == 1) {
        _handleFileSelection(files[0]);
      }
    });
  }

  void _handleFileSelection(html.File file) {
    final blob = html.Blob([file.slice()], 'video/mp4');
    final url = html.Url.createObjectUrlFromBlob(blob);
    setState(() {
      _controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          _controller!.setLooping(true);
          _controller!.play();
        });
      _fileSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_fileSelected && _controller != null) ...[
              AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Upload the video to a server
                },
                child: Text('Upload'),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _fileInput!.click();
              },
              child: Text('Choose Video'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
