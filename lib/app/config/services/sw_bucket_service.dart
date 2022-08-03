import 'dart:io';
import 'package:aws_s3_plugin_flutter/aws_s3_plugin_flutter.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class S3BucketService {
  static String url = '';
  static String result = '';

  static Future<String> getPreSignedURLFromUnsigned({
    required String awsFolderPath,
  }) async {
    AwsS3PluginFlutter awsS3 = AwsS3PluginFlutter(
      awsFolderPath: awsFolderPath,
      region: Regions.US_EAST_1,
      bucketName: 'jekawinusers',
      AWSSecret: "Jr27z7vajvhhRxRvfW7+VG/yjT86+FaJLhw5E7us",
      AWSAccess: 'AKIAZG3ZF6NYWY5MTI7L',
      fileNameWithExt: result,
    );
    awsS3.getUploadStatus;
    return await awsS3.getPreSignedURLOfFile;
  }

  static Future<String> uploadImage({
    required File file,
    required String awsFolderPath,
    required int number,
    context,
    required String extension,
  }) async {
    print('I went through');
    String fileName =
        "$extension\_${DateTime.now().millisecondsSinceEpoch}$extension";
    AwsS3PluginFlutter awsS3 = AwsS3PluginFlutter(
      awsFolderPath: awsFolderPath,
      file: file,
      fileNameWithExt: fileName,
      region: Regions.US_EAST_1,
      bucketName: 'jekawinusers',
      AWSSecret: "Jr27z7vajvhhRxRvfW7+VG/yjT86+FaJLhw5E7us",
      AWSAccess: 'AKIAZG3ZF6NYWY5MTI7L',
    );
    displayUploadDialog(awsS3, context);

    try {
      try {
        result = await awsS3.uploadFile;
        debugPrint("Result :'$result'.");
      } on PlatformException {
        debugPrint("Result :'$result'.");
      }
      Future.delayed(const Duration(seconds: 5), () {
        BotToast.showText(
            text:
                "Upload successful.\nClick on update profile to save changes.");
        Get.back();
      });
    } on PlatformException catch (e) {
      debugPrint("Failed :'${e.message}'.");
    }
    return url;
  }

  static Future displayUploadDialog(AwsS3PluginFlutter awsS3, context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => StreamBuilder(
        stream: awsS3.getUploadStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return buildFileUploadDialog(snapshot, context);
        },
      ),
    );
  }

  static AlertDialog buildFileUploadDialog(
      AsyncSnapshot snapshot, BuildContext context) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.all(6),
        child: LinearProgressIndicator(
          value: (snapshot.data != null) ? snapshot.data / 100 : 0,
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColorDark),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Uploading... '),
            Text("${snapshot.data ?? 0}%"),
          ],
        ),
      ),
    );
  }
}
