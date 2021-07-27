import 'dart:io';

void main() {
  showData();
}

void showData() {
  startTask();
  accessData();
  fetchData();
}

void startTask() {
  String info1 = "요청수행 시작";
  print(info1);
}

void accessData() {
  String info1 = "데이터에 접속중";
  print(info1);
}

void fetchData() {
  String info1 = "잔액은 8,000원 입니다";
  print(info1);
}
