class ResendOtpResponseModel {
  bool success;
  String message;

  ResendOtpResponseModel( {
    required this.success,
    required this.message,
  });


  factory ResendOtpResponseModel.fromJson(Map<String, dynamic> json) => ResendOtpResponseModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}