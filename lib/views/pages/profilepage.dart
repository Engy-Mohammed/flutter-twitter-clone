import 'package:flutter/material.dart';

import '../../bottombar.dart';
import 'editProfile.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  // @override
  // void initState() {
  //   () => Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Bottombar()));
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [coverimage(), profile()],
      ),
    );
  }

  Widget coverimage() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('marym.jpg'))),
    );
  }

  Widget profile() {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/imgflo.jpg'),
                  radius: 43,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen()));
                  },
                  child: Text('Edit Profile',
                      style: TextStyle(color: Colors.blue)))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Engy Mohammed',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '@engy5821',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 15,
              ),
              Text('Joined December 2022',
                  style: TextStyle(fontSize: 15, color: Colors.grey))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Text(
                '0 ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'Following',
                style: TextStyle(
                    color: Color.fromARGB(255, 143, 141, 141), fontSize: 13),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '0 ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'Followers',
                style: TextStyle(
                    color: Color.fromARGB(255, 143, 141, 141), fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget tabs(Size size) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: size * 0.95,
            child: Container(
              child: SafeArea(
                  child: Column(
                children: const <Widget>[
                  TabBar(
                    tabs: [
                      Text("Tweets"),
                      Text("Replies"),
                      Text("Media"),
                      Text("Likes"),
                    ],
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    isScrollable: true,
                  )
                ],
              )),
            ),
          ),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 270,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/twitternotefic.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nothing to see here — \nyet',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Likes, mentions, Retweets, and a whole lot more\n — when it comes from a verified account, you'll\n find it here.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 270,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/twitternotefic.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nothing to see here — \nyet',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Likes, mentions, Retweets, and a whole lot more\n — when it comes from a verified account, you'll\n find it here.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 270,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/twitternotefic.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nothing to see here — \nyet',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Likes, mentions, Retweets, and a whole lot more\n — when it comes from a verified account, you'll\n find it here.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 270,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/twitternotefic.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nothing to see here — \nyet',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Likes, mentions, Retweets, and a whole lot more\n — when it comes from a verified account, you'll\n find it here.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
