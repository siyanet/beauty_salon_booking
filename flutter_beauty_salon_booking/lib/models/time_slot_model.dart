class TimeSlot{
  final String ? id;
  final DateTime startTime;
  final DateTime endTime;
   int numberOfTimes;
  TimeSlot({ this.id, required this.startTime,required this.endTime,this.numberOfTimes = 0});
  Duration get duration => endTime.difference(startTime);

  Map<String, dynamic> toMap(){
    return {
      'startTime': startTime,
      "endTime": endTime,
      "numberOfTimes": numberOfTimes,
    };
  }
  void incrementNumberOfTimes() {
    numberOfTimes++;
  }
}