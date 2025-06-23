import 'dart:io';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';

class ConverterUI extends StatefulWidget {
  final String title, hint;
  final Color buttonColor1;
  final String buttonText1;

  const ConverterUI({
    super.key,
    required this.title,
    required this.hint,
    required this.buttonColor1,
    required this.buttonText1,
  });

  @override
  State<ConverterUI> createState() => _ConverterUIState();
}

class _ConverterUIState extends State<ConverterUI> {
  final _controller = TextEditingController();
  String status = '';
  String? thumbnailUrl;
  double? _progress; 

  Future<void> downloadMp3() async {
    final url = _controller.text.trim();
    if (url.isEmpty) {
      setState(() => status = '유튜브 URL을 입력하지 않으면 다운로드 되지 않아요!');
      return;
    }

    final yt = YoutubeExplode();
    try {
      final video = await yt.videos.get(url);
      final manifest = await yt.videos.streamsClient.getManifest(video.id);
      setState(() => thumbnailUrl = video.thumbnails.highResUrl);

      final audioStream = manifest.audioOnly.withHighestBitrate();
      final tempDir = await getTemporaryDirectory();

      if (!(await tempDir.exists())) {
        await tempDir.create(recursive: true);
      }

      final ext = audioStream.container.name; // 예: 'webm'
      final tempAudioPath = '${tempDir.path}/temp_audio.$ext';
      final tempAudioFile = File(tempAudioPath);
      final tempSink = tempAudioFile.openWrite();
      final stream = yt.videos.streamsClient.get(audioStream);

      int downloaded = 0;
      final total = audioStream.size.totalBytes;

      await for (final data in stream) {
        downloaded += data.length;
        tempSink.add(data);
        setState(() {
          _progress = downloaded / total;
          status = '${(_progress! * 100).toStringAsFixed(1)}% 다운로드 중...';
        });
      }

      await tempSink.close();

      final fileName =
          video.title.replaceAll(RegExp(r'[\\/:*?"<>|]'), '') + '.mp3';

      final downloadDir = Directory('/storage/emulated/0/Download');
      if (!await downloadDir.exists()) {
        await downloadDir.create(recursive: true);
      }

      final mp3Path = '${downloadDir.path}/$fileName';
      final session = await FFmpegKit.execute(
        '-y -i "$tempAudioPath" -vn -ar 44100 -ac 2 -b:a 192k "$mp3Path"',
      );

      await tempAudioFile.delete();

      final returnCode = await session.getReturnCode();
      if (returnCode?.isValueSuccess() ?? false) {
        setState(() {
          status = ' 다운로드가 완료되었어요!: $fileName';
          _progress = null;
        });
      } else {
        final logs = await session.getAllLogsAsString();
        setState(() {
          status = ' FFmpeg 오류:\n$logs';
          _progress = null;
        });
      }
    } catch (e) {
      setState(() {
        status = ' 오류가 발생했어요.: $e';
        _progress = null;
      });
    } finally {
      yt.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 600,
          child: Column(
            children: [
              if (thumbnailUrl != null)
                Image.network(thumbnailUrl!, height: 200),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.title,
                  hintText: widget.hint,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: downloadMp3,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.buttonColor1,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(widget.buttonText1),
              ),
              if (_progress != null) ...[
                const SizedBox(height: 24),
                LinearProgressIndicator(
                  value: _progress,
                  minHeight: 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation(widget.buttonColor1),
                ),
              ],
              const SizedBox(height: 24),
              Text(status, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
