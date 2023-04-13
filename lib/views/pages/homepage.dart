import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/views/pages/profilepage.dart';
// import 'package:twitter_clone/views/pages/massegepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children:[
              UserAccountsDrawerHeader(
                  currentAccountPictureSize: Size.fromRadius(30),
                  decoration: BoxDecoration(color: Colors.white),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/imgflo.jpg'),
                  ),
                  accountName: Text(
                    'Engy Mohammed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: Text('@engy5821',
                      style: TextStyle(
                        color: Color.fromARGB(255, 143, 141, 141),
                      ),
                    ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15,left: 15),
                        child: Row(
                          children: [
                            Text( '0',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                             Text( 'Following',
                            style: TextStyle(color:Color.fromARGB(255, 143, 141, 141), fontSize: 13),)
                            ,
                            SizedBox(width: 20,),
                            Text( '0',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                             Text( 'Followers',
                            style: TextStyle(color:Color.fromARGB(255, 143, 141, 141), fontSize: 13),)
                          ],
                        ),
                      ), 
              ListTile(
                leading: Icon(Icons.person,color: Colors.black,),
                title: Text('Profile',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:  (context)=>Profilepage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.line_style_outlined,color: Colors.black,),
                title: Text('Topics',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.list_alt_sharp,color: Colors.black,),
                title: Text('List',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.bookmark,color: Colors.black,),
                title: Text('Bookmark',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                onTap: (){},
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(
          FontAwesomeIcons.featherPointed,
          size: 30,
        ),
      ),
      // appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Stack(
            children: [
              SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/imgflo.jpg'),
                              ),
                            );
                          }),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/twitterlogo.png'))),
                          ),
                          const Icon(
                            Icons.amp_stories_rounded,
                            color: Colors.black,
                            size: 32,
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/stackover.png'),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'StackOverFlow',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '@StackOverflow · 1 April 23',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                  'We\'re celebrating out 14th year of Stack\nGives Back! Every year our community\nmoderators select their charity of choice to\ndonate to in the spirit of Keeping Community\nat Our Center, including @GirlsWhoCode,\n@UNICEF, and other charitable organizations.\n\nstackoverflow.blog/2023/04/1/sta...'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 180,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('stackk.png'))),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.squarePollVertical,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.comment,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.retweet,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/flutterlogo.jpeg'),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Flutter',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '@FlutterDev · 19 feb 23',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                  'The #FlutterForward agende is LIVE!\n\nYou won\'t want to miss the latest updates\nfrom the team about the great Flutter content\nto come on Mars 25,2023\n\n\n*Keynote\n*Workshops\n#AskFlutter Live\nFlutter Tips\nAnd more!\n\nRegister now!'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 180,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/bannertwitterhomescreen.png'))),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.squarePollVertical,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.comment,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.retweet,
                                    color: Colors.grey,
                                    size: 21,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '1.4m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
