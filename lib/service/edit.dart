import 'dart:io';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class LyricsEditor {
  Future<String> applyMetadata({
    required File mp3File,
    required String title,
    required String artist,
    required String album,
    required String lyrics,
  }) async {
    try {
      // 권한 확인
      if (!await Permission.manageExternalStorage.isGranted) {
        await Permission.manageExternalStorage.request();
      }

      // 원본 파일 경로
      final originalPath = mp3File.path;

      // 출력 파일 경로 (Download 폴더에 저장)
      final downloadDir = Directory('/storage/emulated/0/Download');
      if (!await downloadDir.exists()) {
        await downloadDir.create(recursive: true);
      }

      final fileName = mp3File.uri.pathSegments.last;
      final outputPath = '${downloadDir.path}/edited_$fileName';

      // FFmpeg 명령어 실행
      final command = [
        '-i',
        '"$originalPath"',
        '-c',
        'copy',
        '-metadata',
        'title=$title',
        '-metadata',
        'artist=$artist',
        '-metadata',
        'album=$album',
        '-metadata',
        'lyrics=$lyrics',
        '-id3v2_version',
        '3',
        '"$outputPath"'
      ].join(' ');

      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        return '✅ 메타데이터 삽입 완료!\n\n$outputPath';
      } else {
        final logs = await session.getAllLogsAsString();
        return '❌ FFmpeg 오류 발생\n\n$logs';
      }
    } catch (e) {
      return '❌ 예외 발생: $e';
    }
  }
}
