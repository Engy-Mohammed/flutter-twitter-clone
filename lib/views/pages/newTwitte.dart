import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/views/pages/homepage.dart';

class NewTweet extends StatefulWidget {
  const NewTweet({super.key});

  @override
  State<NewTweet> createState() => _NewTweetState();
}

class _NewTweetState extends State<NewTweet> {
  bool _isButtonDisabled = true;
  final _textEditingController = TextEditingController();
  // File? _image;
  File? _video;
  File _imageFile = File('');

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        print(_imageFile.uri);
      });
    }
  }

  void _getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _video = File(video.path);
    }
  }

  void CreateTweet(String content) async {
    var url = Uri.http('localhost:8000', 'api/tweet/create');

    var response = await http.post(url, body: {
      'content': content,
      'user': '1'
    }, headers: {
      'Authorization': 'Bearer yM414pLE1Hc7G1Xq5kFdX1fbaQQQqK',
    });
    print(content);
    if (response.statusCode == 201) {
      print('Tweet created successfully!');
      content = '';

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      print('Error creating tweet: ${response.statusCode}');
    }
  }

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
            children: <Widget>[
              _imageFile == null
                  ? Text("no image ")
                  : Image.asset(
                      _imageFile.path,
                      width: 200.0,
                      height: 200.0,
                    ),
              IconButton(
                onPressed: _getImage,
                icon: const Icon(Icons.image),
              ),
              IconButton(
                onPressed: _getVideo,
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Homepage()));
                      },
                child: Text('tweet'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
