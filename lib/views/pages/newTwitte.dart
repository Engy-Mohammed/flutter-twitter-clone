import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/views/pages/homepage.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http_parser/http_parser.dart';


class NewTweet extends StatefulWidget {
  const NewTweet({super.key});

  @override
  State<NewTweet> createState() => _NewTweetState();
}

class _NewTweetState extends State<NewTweet> {
  bool _isButtonDisabled = true;
  final _textEditingController = TextEditingController();
  File? _video;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  VideoPlayerController? _controller;
  html.FileUploadInputElement? _fileInput;
  bool _fileSelected = false;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    setState(() {
      _imageFile = File(pickedFile!.path);
      print(_imageFile!.path);
    });
  }

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
          _controller!.setLooping(false);
          _controller!.play();
        });
      _fileSelected = true;
    });

    print(_fileInput!.files.toString());
  }

  // void CreateTweet(String content) async {
  //   var url = Uri.http('localhost:8000', 'api/tweet/create');

  //   var response = await http.post(url, body: {
  //     'content': content,
  //     'user': '1',
  //      "media": [
  //           {"file": "loclhost:8000/api/media/tweet_media/${_imageFile!.path}"},

  //           {"file": "loclhost:8000/api/media/tweet_media/${_fileInput!.files}"},

  //       ]
  //   }, headers: {
  //     'Authorization': 'Bearer dbuKGoxXiEtt7lrll7zaqmXkzjEwpC',
  //   });
  //   print(content);

  //   if (response.statusCode == 201) {
  //     print('Tweet created successfully!');
  //     content = '';

  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Homepage()));
  //   } else {
  //     print('Error creating tweet: ${response.statusCode}');
  //   }
  // }

  void CreateTweet(String content) async {
  var url = Uri.http('localhost:8000', 'api/tweet/create');

  var imageBytes, videoBytes;
  String? imageBase64, videoBase64;

  if (_imageFile != null) {
    imageBytes = await _imageFile!.readAsBytes();
    imageBase64 = base64.encode(imageBytes);
  }

  // if (_video != null) {
  //   videoBytes = await _video!.readAsBytes();
  //   videoBase64 = base64.encode(videoBytes);
  // }

  var response = await http.post(
    url,
    body: {
      'content': content,
      'user': '1',
      'media':[{'file':_imageFile}]
      // 'media': json.encode([
      //   if (imageBase64 != null)
      //     {
      //       'file': imageBase64,
      //       'type': 'image',
      //       'extension': _imageFile!.path.split('.').last,
      //     },
      //   if (videoBase64 != null)
      //     {
      //       'file': videoBase64,
      //       'type': 'video',
      //       'extension': _video!.path.split('.').last,
      //     },
      // ]),
      
    },
    headers: {
      'Content-Type':'multipart/form-data',
      'Authorization': 'Bearer zsWR1aZVLGJW6kcYd92VCaKgQKN4Oz',
    },
  );

  if (response.statusCode == 201) {
    print('Tweet created successfully!');
    content = '';

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
  } else {
    print('Error creating tweet: ${response.statusCode}');
  }
}

  // void CreateTweet(String content) async {
  //   var url = Uri.http('localhost:8000', 'api/tweet/create');

  //   var request = myhttp.MultipartRequest('POST', url)
  //     ..fields['content'] = content
  //     ..fields['user'] = '1';

  //   if (_imageFile != null) {
  //     var imageBytes = await _imageFile!.readAsBytes();
  //     var imageFile = http.MultipartFile.fromBytes(
  //       'media[{}]',
  //       imageBytes,
  //       filename: _imageFile!.path.split('/').last,
  //       contentType: MediaType('image', _imageFile!.path.split('.').last),
  //     );
  //     request.files.add(imageFile);
  //     print("image added${imageFile}");
  //   }

  //   // if (_video != null) {
  //   //   var videoBytes = await _video!.readAsBytes();
  //   //   var videoFile = http.MultipartFile.fromBytes(
  //   //     'media[]',
  //   //     videoBytes,
  //   //     filename: _video!.path.split('/').last,
  //   //     contentType: MediaType('video', _video!.path.split('.').last),
  //   //   );
  //   //   request.files.add(videoFile);
  //   //   print("video added${videoFile}");
  //   // }

  //   request.headers['Authorization'] = 'Bearer zsWR1aZVLGJW6kcYd92VCaKgQKN4Oz';

  //   var response = await request.send();
  //   if (response.statusCode == 201) {
  //     print('Tweet created successfully!');
  //     content = '';

  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Homepage()),
  //     );
  //   } else {
  //     print('Error creating tweet: ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Tweet'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textEditingController,
              onChanged: (text) {
                setState(() {
                  _isButtonDisabled = text.isEmpty;
                });
              },
              decoration: const InputDecoration(
                hintText: 'What\'s happening?',
              ),
              maxLength: 280,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: const Icon(Icons.photo),
              ),
              IconButton(
                onPressed: () {
                  _fileInput!.click();
                },
                icon: const Icon(Icons.video_call),
              ),
              ElevatedButton(
                onPressed: _isButtonDisabled
                    ? null
                    : () {
                        CreateTweet(_textEditingController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('tweet created'),
                          ),
                        );
                      },
                child: Text('tweet'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (_imageFile != null) ...[
                Image.network(
                  _imageFile!.path,
                  width: 250,
                  height: 150,
                ),
                SizedBox(height: 20),
              ],
              if (_fileSelected && _controller != null) ...[
                Container(
                  width: 300,
                  height: 210,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      Positioned.fill(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.skip_previous),
                              onPressed: () {
                                _controller!.seekTo(Duration.zero);
                              },
                            ),
                            IconButton(
                              icon: Icon(_controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              onPressed: () {
                                setState(() {
                                  if (_controller!.value.isPlaying) {
                                    _controller!.pause();
                                  } else {
                                    _controller!.play();
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.skip_next),
                              onPressed: () {
                                _controller!
                                    .seekTo(_controller!.value.duration);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
