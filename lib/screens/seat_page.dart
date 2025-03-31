import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;

  SeatPage({required this.departure, required this.arrival, required Key key});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<List<bool>> seatStatus = List.generate(
    10,
    (_) => List.generate(4, (_) => false),
  );

  // 선택된 좌석을 기록할 리스트
  List<String> selectedSeats = [];

  void _updateSelectedSeats(int row, int col) {
    // 좌석 번호 추가 또는 제거
    String seatLabel = _getSeatLabel(row, col);
    setState(() {
      if (seatStatus[row][col]) {
        selectedSeats.add(seatLabel);
      } else {
        selectedSeats.remove(seatLabel);
      }
    });
  }

  // 좌석 번호 생성
  String _getSeatLabel(int row, int col) {
    String letter = '';
    switch (col) {
      case 0:
        letter = 'A';
        break;
      case 1:
        letter = 'B';
        break;
      case 2:
        letter = 'C';
        break;
      case 3:
        letter = 'D';
        break;
    }
    return '$letter-${row + 1}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              '${widget.departure} → ${widget.arrival}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.arrow_circle_right_outlined,
              size: 30,
              color: Colors.purple,
            ),
            SizedBox(height: 20),

            // 좌석 상태 안내 레이블 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '좌석 선택 상태:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.grey[300],
                  child: Center(child: Text(' ')),
                ),
                Text(
                  ' 미선택',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.purple,
                  child: Center(child: Text(' ')),
                ),
                Text(
                  ' 선택됨',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),

            Expanded(
              child: Column(
                children: [
                  // A와 B는 왼쪽 열에 배치, C와 D는 오른쪽 열에 배치
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // A와 B 위에 배치
                      Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'A',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'B',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(width: 80), // B와 C 사이 간격 추가
                      // C와 D 위에 배치
                      Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'C',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'D',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // ABCD와 좌석 간의 세로 간격 추가
                  // 좌석 아래에 번호 표시
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, rowIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 좌석 번호 A (왼쪽)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  seatStatus[rowIndex][0] = !seatStatus[rowIndex][0];
                                  _updateSelectedSeats(rowIndex, 0);
                                });
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: seatStatus[rowIndex][0]
                                      ? Colors.purple
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // 좌석 번호 B (왼쪽)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  seatStatus[rowIndex][1] = !seatStatus[rowIndex][1];
                                  _updateSelectedSeats(rowIndex, 1);
                                });
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: seatStatus[rowIndex][1]
                                      ? Colors.purple
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // 좌석 숫자 배치 (가운데)
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                '${rowIndex + 1}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            // 좌석 번호 C (오른쪽)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  seatStatus[rowIndex][2] = !seatStatus[rowIndex][2];
                                  _updateSelectedSeats(rowIndex, 2);
                                });
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: seatStatus[rowIndex][2]
                                      ? Colors.purple
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // 좌석 번호 D (오른쪽)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  seatStatus[rowIndex][3] = !seatStatus[rowIndex][3];
                                  _updateSelectedSeats(rowIndex, 3);
                                });
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: seatStatus[rowIndex][3]
                                      ? Colors.purple
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: selectedSeats.isNotEmpty
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('선택된 좌석'),
                                content: Text('선택한 좌석: ${selectedSeats.join(', ')}'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // 다이얼로그 닫기
                                    },
                                    child: Text('취소'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // 다이얼로그 닫기
                                      Navigator.pop(context); // HomePage로 돌아가기
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              ),
                            );
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                    ),
                    child: Text(
                      '예매하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
