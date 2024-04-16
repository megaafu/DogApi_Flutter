class DogData {
  final String message;
  final String status;
  DogData({
    required this.message,
    required this.status,
  });
  factory DogData.fromJson(Map<String, dynamic> json) => DogData(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
