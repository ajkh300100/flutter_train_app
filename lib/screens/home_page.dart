import 'package:flutter/material.dart';
import 'station_list_page.dart';
import 'seat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departure;
  String? arrival;

  void _selectStation(bool isDeparture) async {
    final selectedStation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(
          key: UniqueKey(), // 🔹 Key 추가
          isDeparture: isDeparture, onStationSelected: (String selected) {
            setState(() {
              if (isDeparture) {
                departure = selected;
              } else {
                arrival = selected;
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기차 예매')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectStation(true),
              child: Text(departure ?? '출발역 선택'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _selectStation(false),
              child: Text(arrival ?? '도착역 선택'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: (departure != null && arrival != null)
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeatPage(
                            key: UniqueKey(), // 🔹 Key 추가
                            departure: departure!,
                            arrival: arrival!,
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text('좌석 선택'),
            ),
          ],
        ),
      ),
    );
  }
}
