import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  List musicList = [
    {
      "title": "Life is a Dream",
      "artist": "Michael Ramir",
      "cover":
          "https://images.pexels.com/photos/1884306/pexels-photo-1884306.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
    },
    {
      "title": "Feeling Happy",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/2682877/pexels-photo-2682877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-feeling-happy-5.mp3",
    },
    {
      "title": "Dance with Me",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
    },
    {
      "title": "Sleepy Cat",
      "artist": "Alejandro Magaña",
      "cover":
          "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
    },
    {
      "title": "Delightful",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3",
    },
    {
      "title": "Life is a Dream",
      "artist": "Michael Ramir",
      "cover":
          "https://images.pexels.com/photos/1884306/pexels-photo-1884306.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
    },
    {
      "title": "Feeling Happy",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/2682877/pexels-photo-2682877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-feeling-happy-5.mp3",
    },
    {
      "title": "Dance with Me",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
    },
    {
      "title": "Sleepy Cat",
      "artist": "Alejandro Magaña",
      "cover":
          "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
    },
    {
      "title": "Delightful",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3",
    },
  ];

  String currentTitle = "";
  String currentArtist = "";
  String currentCover = "";
  String currentSong = "";
  IconData btnIcon = Icons.play_arrow;

  AudioPlayer _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  Duration musicDuration = Duration();
  Duration musicPosition = Duration();

  playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      _audioPlayer.pause();
      int result = await _audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await _audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
        });
      }
    }

    _audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        musicDuration = event;
      });
    });

    _audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        musicPosition = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff3C415C),
              Color(0xff232323),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 22.0,
                  right: 22.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Music play",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/sk.jpg"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: musicList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        playMusic(musicList[index]["url"]);
                        setState(() {
                          currentTitle = musicList[index]["title"];
                          currentArtist = musicList[index]["artist"];
                          currentCover = musicList[index]["cover"];
                        });
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            musicList[index]["cover"],
                          ),
                        ),
                        title: Text(
                          musicList[index]["title"],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          musicList[index]["artist"],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        trailing: Container(
                          margin: EdgeInsets.all(17.0),
                          child: Icon(
                            Icons.music_note,
                            color: Colors.blueGrey.shade200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 1.0,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(currentCover),
                      ),
                      title: Text(
                        currentTitle,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        currentArtist,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      trailing: Container(
                        height: 40.0,
                        width: 40.0,
                        margin: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (isPlaying) {
                              _audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.play_arrow;
                                isPlaying = false;
                              });
                            } else {
                              _audioPlayer.resume();

                              setState(() {
                                btnIcon = Icons.pause;
                                isPlaying = true;
                              });
                            }
                          },
                          icon: Icon(
                            btnIcon,
                            size: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22.0,
                        right: 30.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${musicPosition.inMinutes}:${musicPosition.inSeconds.remainder(60)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Expanded(
                            child: Slider.adaptive(
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                              value: musicPosition.inSeconds.toDouble(),
                              max: musicDuration.inSeconds.toDouble(),
                              onChanged: (val) {},
                            ),
                          ),
                          Text(
                            "${musicDuration.inMinutes}:${musicDuration.inSeconds.remainder(60)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
