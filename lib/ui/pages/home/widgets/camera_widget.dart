import 'package:amigapp/repository/amiga_repository.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CameraWidget extends StatelessWidget {
  final int cameraNumber;

  const CameraWidget({required this.cameraNumber, super.key});

  @override
  Widget build(BuildContext context) {
    final amigaRepository = Injector.appInstance.get<AmigaRepository>();
    return Column(
      children: [
        Text('Camera $cameraNumber'),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          width: 430,
          child: FutureBuilder<String>(
            future: amigaRepository.getCameraVideo(cameraNumber),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    'Connecting to camera $cameraNumber',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                );
              }
              if (snapshot.hasError) return const Text('Something went wrong connecting to camera');

              return YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: snapshot.data!,
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: true,
                      loop: true,
                      hideThumbnail: true,
                      isLive: true,
                    )),
                showVideoProgressIndicator: false,
                thumbnail: const SizedBox(),
              );
            },
          ),
        )
      ],
    );
  }
}
