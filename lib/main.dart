import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone_with_mux_and_video_player/models/asset_data.dart';
import 'package:youtube_clone_with_mux_and_video_player/screens/mux_shorts_screen.dart';
import 'package:youtube_clone_with_mux_and_video_player/services/video_client.dart';
import 'models/data.dart';

import 'screens/shorts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MuxShortsScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getAssets();
    super.initState();
  }

  Future<void> getAssets() async {
    final response = await VideoClient().fetchMuxAssets();
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      // Expanded(
      //         child: FutureBuilder<AssetData>(
      //           future: VideoClient().getAssetList(),
      //           builder: (context, snapshot) {
      //             if (snapshot.hasData) {
      //               AssetData assetData = snapshot.data!;
      //               int length = assetData.data.length;

      //               return ListView.separated(
      //                 physics: BouncingScrollPhysics(),
      //                 itemCount: length,
      //                 itemBuilder: (context, index) {
      //                   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      //                       int.parse(assetData.data[index].createdAt) * 1000);
      //                   DateFormat formatter = DateFormat.yMd().add_jm();
      //                   String dateTimeString = formatter.format(dateTime);

      //                   String currentStatus = assetData.data[index].status;
      //                   bool isReady = currentStatus == 'ready';

      //                   String playbackId = isReady
      //                       ? assetData.data[index].playbackIds[0].id
      //                       : '';

      //                   return VideoTile(
      //                     assetData: assetData.data[index],
      //                     thumbnailUrl: 'https://image.mux.com/$playbackId',
      //                     isReady: isReady,
      //                     dateTimeString: dateTimeString,
      //                   );
      //                 },
      //                 separatorBuilder: (_, __) => SizedBox(
      //                   height: 16.0
      //                 ),
      //               );
      //             }
      //             return Container(
      //               child: Text(
      //                 'No videos present',
      //                 style: TextStyle(
      //                   color: Colors.black45,
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      // ,
    );
  }
}
