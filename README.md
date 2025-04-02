# Flutter Train App

## 프로젝트 개요
Flutter로 개발된 기차 예매 서비스 앱입니다. 사용자는 출발역과 도착역을 선택하고, 원하는 좌석을 예매할 수 있습니다.

## 주요 기능
- **홈 화면 (HomePage)**
  - 출발역 및 도착역 선택
  - 좌석 선택 화면으로 이동
- **역 선택 화면 (StationListPage)**
  - 사용 가능한 기차역 목록 표시
  - 역 선택 시 홈 화면으로 값 전달
- **좌석 선택 화면 (SeatPage)**
  - 좌석 배치 및 선택 기능
  - 예매 버튼 클릭 시 예매 확인 다이얼로그 출력

## 실행 방법
1. Flutter가 설치되어 있는지 확인하세요.
2. 프로젝트를 클론합니다.
   \`\`\`sh
   git clone https://github.com/ajkh300100/flutter_train_app.git
   \`\`\`
3. 프로젝트 디렉터리로 이동합니다.
   \`\`\`sh
   cd flutter_train_app
   \`\`\`
4. 패키지를 설치합니다.
   \`\`\`sh
   flutter pub get
   \`\`\`
5. 앱을 실행합니다.
   \`\`\`sh
   flutter run
   \`\`\`

## 사용된 기술 스택
- Flutter
- Dart
