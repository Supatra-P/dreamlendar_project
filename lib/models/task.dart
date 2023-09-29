class Task {
  int? id;
  String? title;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? repeat;
  int? alert;
  String? showAs;
  String? note;
  int? color;
  int? codeSee;

  Task({
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.repeat,
    this.alert,
    this.showAs,
    this.note,
    this.color,
    this.codeSee,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    repeat = json['repeat'];
    alert = json['alert'];
    showAs = json['showAs'];
    note = json['note'];
    color = json['color'];
    codeSee = json['codeSee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['repeat'] = this.repeat;
    data['alert'] = this.alert;
    data['showAs'] = this.showAs;
    data['note'] = this.note;
    data['color'] = this.color;
    data['codeSee'] = this.codeSee;
    return data;
  }
}
