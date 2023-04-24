import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/basic.dart';
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
  File? _image;
  File? _video;
  File? _imageFile;
  List<XFile>? _imageFileList;
  final ImagePicker _picker = ImagePicker();
  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  Future<void> _getImage() async {
    // final pickedFile =
    //     await ImagePicker().pickImage(source: ImageSource.gallery);
    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   } else {
    //     print('No image selected.');
    //   }
    // });

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // Upload the image to Twitter
      // await uploadImageToTwitter(_imageFile);
    }
  }

  void _getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _video = File(video.path);
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
              _image == null
                  ? Text('No image selected.')
                  : Image.file(
                      _image!,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
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
