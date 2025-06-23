# [앱 프로젝트] TubeTune

## 프로젝트 소개 및 설명
### [프로젝트 설명 및 배경]
* 평소에 음악을 듣는 것을 좋아하고, 1시간넘게 이동하는 시간이 많기 때문에 음악을 많이 들을수 밖에 없었고, 유튜브뮤직,스포티파이등 노래를 듣기에는 구독료가 나가기 때문에 유튜브의 음악을 음원파일로 저장해서 휴대폰으로 광고없이 무제한으로 들을 수 있을 것 같아서 만듦 
* FLUTTER를 기반으로하는 안드로이드 앱 : 유튜브 영상을 음원파일로 저장하고, mp3 음원파일의 곡이름, 가수이름, 앨범명을 수정할 수 있는 앱
<hr>

## 1. 개발환경 및 사용 패키지
### [사용기술]
* Front-end : Dart
* Framework : Flutter
* Back-end : 사용자의 로컬에 저장하는 형식이기에 Backend는 지원 X
### [개발환경]
* Github
* Vscode
* AndroidStudio

### [사용 패키지]
* permission_handler: 앱에서 다양한 권한을 요청 및 상태를 확인

* path_provider: 앱에서 플랫폼별 디렉토리 경로를 가져옴

* dio: HTTP 클라이언트로, 네트워크 요청 및 응답 처리를 지원

* cupertino_icons: iOS 스타일의 아이콘을 제공

* youtube_explode_dart: YouTube의  영상, 오디오 등의 데이터를 추출

* device_info_plus: 디바이스의 하드웨어 및 소프트웨어 정보를 가져옴

* ffmpeg_kit_flutter_new: FFmpeg를 통해 오디오/비디오 처리 및 변환 기능

* audio_metadata_reader: 오디오(mp3) 파일의 제목, 아티스트, 앨범 등의 메타데이터 읽기

* file_picker: 파일 탐색기를 열어 사용자가 파일을 선택하게 함

* image_picker: 갤러리 또는 카메라에서 이미지를 선택


## 2.📋 요구사항정의서 및 간트차트 및 마일스톤

| 번호    | 요구사항 ID | 내용                                            | 우선순위  | 비고       |
| ----- | ------- | --------------------------------------------- | ----- | -------- |
| UR-01 | 유저-01   | 사용자는 유튜브 URL을 입력하여 MP3 음원 파일로 변환할 수 있어야 한다.   | 상 | 필수 기능    |
| UR-02 | 유저-02   | 사용자는 음원 변환 시 해당 곡의 썸네일을 확인할 수 있어야 한다.         | 중 | UX 향상    |
| UR-03 | 유저-03   | 사용자는 음원 파일에 곡 제목, 아티스트, 앨범명을 직접 수정할 수 있어야 한다. | 상 | 필수 기능    |
| UR-04 | 유저-04   | 사용자는 다운로드 진행 상태를 다운로드바로 확인할 수 있어야 한다.         | 중 | 편의성      |
| UR-05 | 유저-05   | 앱은 최소한의 조작(5회 이하 클릭)으로 변환 및 저장까지 가능해야 한다.     | 상 | UI/UX 핵심 |
| UR-06 | 유저-06   | 앱은 Android 13 이상 기기에서 정상적으로 동작해야 한다.          | 중 | OS 정책 대응 |
| UR-07 | 유저-07   | 사용자는 추후 가사 및 앨범 커버 이미지를 삽입할 수 있어야 한다.         | 하 | 향후 확장    |

### 개발자 요구사항 
| 번호    | 요구사항 ID | 내용                                                               | 우선순위  | 비고         |
| ----- | ------- | ---------------------------------------------------------------- | ----- | ---------- |
| DR-01 | 개발-01   | 앱은 백엔드 없이 모든 기능이 로컬(Android) 저장소 기반으로 구현되어야 한다.                  | 상 | 무서버 구조     |
| DR-02 | 개발-02   | `youtube_explode_dart`를 이용해 유튜브 메타데이터 및 스트림 URL을 가져와야 한다.        | 상 | YouTube 연동 |
| DR-03 | 개발-03   | `ffmpeg_kit_flutter_new`를 사용하여 음원 변환 및 메타데이터 삽입을 처리해야 한다.        | 상 | FFmpeg 필수  |
| DR-04 | 개발-04   | `path_provider`로 저장 위치를 지정하고, `permission_handler`로 권한을 처리해야 한다. | 상 | 파일/권한 처리   |
| DR-05 | 개발-05   | `dio` 또는 `flutter_youtube_downloader`를 통해 영상/음원을 다운로드해야 한다.      | 상 | 네트워크 처리    |
| DR-06 | 개발-06   | 썸네일 이미지는 영상의 메타정보에서 추출하거나 URL 기반으로 렌더링해야 한다.                     | 중 | 이미지 처리     |
| DR-07 | 개발-07   | 모든 UI는 Cupertino 스타일과 Material 디자인을 조합하여 구성해야 한다.                | 하 | 일관성 UX     |


### 마일스톤
| 번호 | 마일스톤 이름           | 설명                             | 날짜         |
| -- | ----------------- | ------------------------------ | ---------- |
| 1  | 프로젝트 계획 및 착수      | 프로젝트 계획 수립 및 디자인 착수            | 2025-05-17 |
| 2  | 개발 환경 구축 완료       | 개발 환경 셋업 완료 (UI 구성 포함)         | 2025-05-23 |
| 3  | 요구사항 정의 완료        | 메인, 변환, 다운로드바 등 기능요소 정의 정리 완료  | 2025-05-27 |
| 4  | 전체 페이지 디자인 및 틀 완성 | 모든 페이지 레이아웃 및 구조 개발 완료 (기능 제외) | 2025-06-07 |
| 5  | 전체 기능 개발 완료       | 기능 구현 및 내부 테스트 완료 | 2025-06-14 |
| 6  | 앱 기능 테스트          | 전체 통합 기능 테스트  | 2025-06-20 |
| 7  | 최종 점검             | 전체 오류 수정 및 다듬기, 최종  테스트     | 2025-06-22 |



### 간트차트 
![dd](https://github.com/user-attachments/assets/1677f4ee-b53a-4b46-a02c-e7ef429f5e61)




## 3. 목표
### [UI/UX 및 프론트 목표]
* 최대한 간결하고 직관적으로 디자인 할 것
* 사용자가 적은횟수의 행동으로 변환 및 다운로드가 가능하게 할 것 

### [기능에서의 목표]
* 다운로드바를 구현하기
* 음원파일에 제목,가수이름,앨범이름을 기입할 수 있게 하기
* 음원파일로 변환시, 해당 유튜브 URL의 썸네일이 나오게 하기


## 4. 핵심기능
### 변환기능
 * 유튜브 URL 음원 변환 기능
 * 음원파일 편집 기능

### 부가기능
 * 다운로드바
 * 다운로드시 해당 음원의 썸네일을 보여주게하는 기능

## 5. 화면구성 
### 1. 메인화면
<div style="display: flex; align-items: center;">
  <img src="https://github.com/user-attachments/assets/f056be25-bc21-4719-9212-93bd5e120eeb" width="200" style="margin-right: 20px;" />
  <p>적은 횟수의 터치로 빠르게 다운로드하게 하기 위해 두 개의 크기가 큰 버튼을 배치 하였고, 해당 버튼을 누르면 관련 페이지로 이동합니다.</p>

### 2. 음원 다운로드 화면 
<img src="https://github.com/user-attachments/assets/c50dd6ca-e4bf-416b-af6d-b5a2ce6fe446" width="200" style="margin-right: 20px;">
<p>url을 입력하고 다운로드 버튼을 누르면 해당 영상 썸네일과 함게 휴대폰 내부 downloads 폴더에 mp3파일이 다운로드 됩니다.</p>

### 3. 음원파일 편집 화면 
<img src="https://github.com/user-attachments/assets/b18fe460-26de-4696-aa5c-ca89f0aa210a" width="200" style="margin-right: 20px;">
<p>mp3파일을 휴대폰 내부에서 선택하여 곡의 제목 가수명 앨범이름을 기입하여 데이터 적용을 누르면 해당 mp3파일에 메타데이터가 적용됩니다. 이렇게 적용하고 나면, spotify같은 뮤직플레이어에 반영됩니다.</p>

</div>

## 6. 시연영상
<img width="80%" src="https://github.com/user-attachments/assets/89bb2d1e-decb-4db4-b798-12a01b8890e5">


## 7. 코드
### 1. 음원 다운로드 코드 
#### 1. 음원 추출 코드 
<pre>
<code>
final video = await yt.videos.get(url);
final manifest = await yt.videos.streamsClient.getManifest(video.id);
final audioStream = manifest.audioOnly.withHighestBitrate();
</code>
  </pre>
youtube_explode_dart를 사용해 유튜브 영상 정보 및 음원 스트림을 가져옴
withHighestBitrate()를 통해 가장 음질이 좋은 오디오 스트림을 선택


#### 2. 썸네일 표시 코드
<pre>
<code>
setState(() => thumbnailUrl = video.thumbnails.highResUrl);
  </code>
</pre>
video.thumbnails.highResUrl을 이용하여 유튜브 영상의 썸네일을 보여줌


#### 3. 다운로드바 코드
<pre>
<code>
await for (final data in stream) {
  downloaded += data.length;
  tempSink.add(data);
  setState(() {
    _progress = downloaded / total;
    status = '${(_progress! * 100).toStringAsFixed(1)}% 다운로드 중...';
  });
}
</code>
</pre>
오디오 스트림을 바이트 단위로 읽어 임시 파일로 저장.
다운로드 진행률을 실시간으로 표시

#### 4. 다운로드 디렉토리로 이동 
  <pre>
<code>
final downloadDir = Directory('/storage/emulated/0/Download');
final mp3Path = '${downloadDir.path}/$fileName';
</code>
  Android의 Download 디렉토리에 최종 MP3 파일을 저장
  </pre>

### 2. 음원 편집
#### 데이터 삽입 코드 
<pre>
<code>
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
</code>
</pre>
기존 음원 파일을 재인코딩 없이(-c copy) 메타데이터만 삽입하는 형태로 따로 저장

### 3. 메인페이지 코드 
<pre>
  <code>
class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myappbar(
      title: "TubeTune", 
      appBarColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedButtonBox(
              label: '유튜브 음원 다운로드',
              color: const Color(0xffc4302b),
              targetPage: YoutubeConverter(),
            ),
            AnimatedButtonBox(
              label: '음원파일 편집',
              color: Colors.greenAccent,
              targetPage: editPage(),
      </code>
</pre>
    

### 4. 음원다운로드 페이지 코드
<pre>
<code>

class YoutubeConverter extends StatelessWidget {
  const YoutubeConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return myappbar(
      title: '유튜브 음원 다운로드',
      appBarColor: Colors.redAccent,
      
      body: const ConverterUI(
        title: '유튜브 링크를 입력해주세요',
        hint: '예시 : https://www.youtube.com/watch?v=...',
        buttonColor1: Colors.redAccent,
        buttonText1: 'MP3로 다운로드',
      ),
    );
  }
}
</code>
</pre>

### 5. 음원편집 페이지 코드
<details>
<pre>
<code>

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

</code>
</pre>
</details>

## 8. 향후 확장 계획
다운로드기록 기능 <br>
가사 기입 및 수정 기능 <br>
앨범 표지 기입 기능 <br>
유튜브 영상 다운로드 기능 <br>
WIFI환경에서만 다운로드 기능 <br>
다운로드 시 알림 기능 <br> 

## 9. 시행착오 극복

FFmpegKit을 사용해 데이터를 삽입했지만 파일이 실제로 저장되지 않거나, 제목 변경 후 음악이 재생되지 않는 문제가 발생 <br>
출력 파일명을 제목 기반으로 변경하고, 저장 경로를 사용자의 기기의 Download 폴더로 명확히 지정해 정상 저장 및 인식되도록 개선함.

## 10. 느낀점
패키지가 오래된 것들이 많아서 직접 코드를 짜야하는 경우가 있거나, 패키지가 오래되서 호환이 안되는 코드들 때문에 계속 오류가 나고 변경해야될 점들이 많아서<br>
프로젝트를 진행하는데 힘들었지만 구현되고나니까 좋았고 이걸로 다른 앱 깔 필요없이 내가 직접 쓸 수 있어서 더 좋은것 같다.

## Thank you
