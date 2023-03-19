int kacDkKaldi(route) {
  DateTime now = DateTime.now();
  DateTime turkishTime = now.toUtc().add(Duration(hours: 3));
  int currentMinuteOfDay = turkishTime.hour * 60 + turkishTime.minute;
  while (true) {
    for (String trainTime in route) {
      int trainHour = int.parse(trainTime.split('.')[0]);
      int trainMinute = int.parse(trainTime.split('.')[1]);
      int trainMinuteOfDay = trainHour * 60 + trainMinute;

      if (trainMinuteOfDay >= currentMinuteOfDay) {
        return trainMinuteOfDay - currentMinuteOfDay;
      }
    }
  }
  // return -1; // if all train times are in the past, return -1 to indicate an error
}


// String getNextTrainTime() {
//   DateTime now = DateTime.now();
//   DateTime turkishTime = now.toUtc().add(Duration(hours: 3));
//   int currentMinuteOfDay = turkishTime.hour * 60 + turkishTime.minute;
//
//   for (String trainTime in saatler) {
//     int trainHour = int.parse(trainTime.split('.')[0]);
//     int trainMinute = int.parse(trainTime.split('.')[1]);
//     int trainMinuteOfDay = trainHour * 60 + trainMinute;
//
//     if (trainMinuteOfDay >= currentMinuteOfDay) {
//       return trainTime;
//     }
//   }
//
//   return saatler[0]; // if all train times are in the past, return the first train of the day
// }

// MARMARA HALKALI YÖNÜ FATİH DURAĞINDAN GEÇİŞ SAATLERİ
List<String> halkali_saatler = [
  "06.11",
  "06.26",
  "06.41",
  "06.56",
  "07.11",
  "07.26",
  "07.41",
  "07.56",
  "08.11",
  "08.26",
  "08.41",
  "08.56",
  "09.11",
  "09.26",
  "09.41",
  "09.56",
  "10.11",
  "10.26",
  "10.41",
  "10.56",
  "11.11",
  "11.26",
  "11.41",
  "11.56",
  "12.11",
  "12.26",
  "12.41",
  "12.56",
  "13.11",
  "13.26",
  "13.41",
  "13.56",
  "14.11",
  "14.26",
  "14.41",
  "14.56",
  "15.11",
  "15.26",
  "15.41",
  "15.56",
  "16.11",
  "16.26",
  "16.41",
  "16.56",
  "17.11",
  "17.26",
  "17.41",
  "17.56",
  "18.11",
  "18.26",
  "18.41",
  "18.56",
  "19.11",
  "19.26",
  "19.41",
  "19.56",
  "20.11",
  "20.26",
  "20.41",
  "20.56",
  "21.11",
  "21.26",
  "21.41",
  "21.56",
  "22.11",
  "22.26",
  "22.41",
  "22.56"
];

List<String> gebze_saatler = [
  "06.25",
  "06.40",
  "06.55",
  "07.10",
  "07.25",
  "07.40",
  "07.55",
  "08.10",
  "08.25",
  "08.40",
  "08.55",
  "09.10",
  "09.25",
  "09.40",
  "09.55",
  "10.10",
  "10.25",
  "10.40",
  "10.55",
  "11.10",
  "11.25",
  "11.40",
  "11.55",
  "12.10",
  "12.25",
  "12.40",
  "12.55",
  "13.10",
  "13.25",
  "13.40",
  "13.55",
  "14.10",
  "14.25",
  "14.40",
  "14.55",
  "15.10",
  "15.25",
  "15.40",
  "15.55",
  "16.10",
  "16.25",
  "16.40",
  "16.55",
  "17.10",
  "17.25",
  "17.40",
  "17.55",
  "18.10",
  "18.25",
  "18.40",
  "18.55",
  "19.10",
  "19.25",
  "19.40",
  "19.55",
  "20.10",
  "20.25",
  "20.40",
  "20.55",
  "21.10",
  "21.25",
  "21.40",
  "21.55",
  "22.10",
  "22.25",
  "22.40",
  "22.55",
  "23.10",
  "23.25",
  "23.40",
  "23.55",
  "00.10",
  "00.25"
];
