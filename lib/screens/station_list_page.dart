import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final bool isDeparture;
  final Function(String) onStationSelected;

  StationListPage({required this.isDeparture, required this.onStationSelected, required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> stations = [
      "수서", "동탄", "평택지제", "천안아산", "오송", "대전", "김천구미",
      "동대구", "경주", "울산", "부산"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isDeparture ? '출발역' : '도착역'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stations[index]),
            onTap: () {
              onStationSelected(stations[index]);
              Navigator.pop(context); // 역 선택 후 뒤로가기
            },
          );
        },
      ),
    );
  }
}
