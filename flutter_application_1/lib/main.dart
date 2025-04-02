import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(FishEbookApp());
}

class FishEbookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '魚類電子書',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicPhotoPage(),
    );
  }
}

class MusicPhotoPage extends StatefulWidget {
  @override
  _MusicPhotoPageState createState() => _MusicPhotoPageState();
}

class _MusicPhotoPageState extends State<MusicPhotoPage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    playBackgroundMusic();
  }

  Future<void> playBackgroundMusic() async {
    // 設定背景音樂重複播放
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    // 使用 AssetSource 播放資源中的背景音樂（確保路徑正確）
    await _audioPlayer.play(AssetSource("music/background.mp3"));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("魚類電子書"),
      ),
      body: Center(
        // 顯示資源中的圖片
        child: Image.asset(
          'assets/images/fish_taiwan.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
