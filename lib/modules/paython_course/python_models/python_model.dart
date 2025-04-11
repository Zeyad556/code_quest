class pythonModel {
  late bool progress;
  late double rate;
  late bool status;
  late String title;
  pythonModel(this.progress, this.rate, this.status, this.title);
  pythonModel.fromJson(Map<String, dynamic> map) {
    this.progress = map["progress"];
    this.rate = map["rate"];
    this.status = map["status"];
    this.title = map["title"];
  }
}
