import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../service/edit.dart'; // 실제 경로로 수정 필요
import '../bar/appbar.dart'; // MyAppBar 위젯 경로

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<editPage> {
  File? selectedFile;
  final titleController = TextEditingController();
  final artistController = TextEditingController();
  final albumController = TextEditingController();

  String status = '데이터를 삽입할 MP3 파일을 선택하세요.';

  Future<void> pickMp3File() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
        status = ' 파일 선택되었습니다.: ${selectedFile!.path.split('/').last}';
      });
    }
  }

  Future<void> applyMetadata() async {
    if (selectedFile == null) {
      setState(() => status = ' 먼저 MP3 파일을 선택하세요.');
      return;
    }

    setState(() => status = '데이터를 삽입중입니다! 잠시만 기다려주세요...');

    final editor = LyricsEditor();
    final result = await editor.applyMetadata(
      mp3File: selectedFile!,
      title: titleController.text.trim(),
      artist: artistController.text.trim(),
      album: albumController.text.trim(),
      lyrics: '',
    );

    setState(() => status = result);
  }

  @override
  Widget build(BuildContext context) {
    return myappbar(
      title: '음원파일 편집',
      appBarColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: pickMp3File,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('MP3 파일 선택'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: '제목 (Title)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: artistController,
              decoration: const InputDecoration(
                labelText: '가수명 (Artist)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: albumController,
              decoration: const InputDecoration(
                labelText: '앨범이름 (Album)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: applyMetadata,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('데이터 적용'),
            ),
            const SizedBox(height: 24),
            Text(
              status,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
