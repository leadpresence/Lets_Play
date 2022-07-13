import 'dart:io';
import 'package:aws_s3_plugin_flutter/aws_s3_plugin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class S3BucketService {
  static String url = '';
  static String result = '';

  static Future<String> getPresignedURLFromUnsigned({
    required String awsFolderPath,
  }) async {
    AwsS3PluginFlutter awsS3 = AwsS3PluginFlutter(
      awsFolderPath: awsFolderPath,
      region: Regions.EU_WEST_1,
      bucketName: dotenv.env['bucketName'],
      AWSSecret: dotenv.env['secretAccessKey'],
      AWSAccess: dotenv.env['accessKey'],
      fileNameWithExt: result,
    );
    return await awsS3.getPreSignedURLOfFile;
  }

  static Future<String> uploadImage({
    required File file,
    required String awsFolderPath,
    required int number,
    context,
    required String extension,
  }) async {
    if (result == null) {
      String fileName =
          "$number$extension\_${DateTime.now().millisecondsSinceEpoch}.$extension";
      AwsS3PluginFlutter awsS3 = AwsS3PluginFlutter(
          awsFolderPath: awsFolderPath,
          file: file,
          fileNameWithExt: fileName,
          region: Regions.EU_WEST_1,
          bucketName: dotenv.env['bucketName'],
          AWSSecret: dotenv.env['secretAccessKey'],
          AWSAccess: dotenv.env['accessKey']);
      displayUploadDialog(awsS3, context);
      try {
        try {
          result = await awsS3.uploadFile;
          debugPrint("Result :'$result'.");
        } on PlatformException {
          debugPrint("Result :'$result'.");
        }
      } on PlatformException catch (e) {
        debugPrint("Failed :'${e.message}'.");
      }
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
            const Expanded(child: Text('Uploading...')),
            Text("${snapshot.data ?? 0}%"),
          ],
        ),
      ),
    );
  }
}
