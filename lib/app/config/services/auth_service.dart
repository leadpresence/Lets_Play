import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/services/di/di_locator.dart';
import 'package:jekawin_mobile_flutter/app/config/services/http/base_urls.dart';
import 'package:jekawin_mobile_flutter/app/constants/app_error.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/auth_response.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/user_singed_up_response.dart';
import '../../constants/network_exceptions.dart';
import '../../modules/signup/models/resendotp_resonse_model.dart';
import '../../modules/signup/models/user_sign_up_model.dart';
import '../data/local/user_local_interface.dart';
import '../data/model/user.dart';
import 'http/http_services.dart';
//chibueze felix 3-2022

abstract class AuthServiceDataSource {
  Future<Either<AppError, String>> signup(UserSignUpModel body);
  Future<Either<AppError, String>> login(String phoneNumber ,String password);

  Future<Either<AppError, String>> resendSignUpResetOtp(String phoneNumber);

}

class AuthServiceImpl extends AuthServiceDataSource {
  final httpProvider = Get.find<HttpService>();
  final prospectIsProvider = Get.find<ProspectIdController>();
  final localDbProvider = Get.find<UserLocalDataSourceInterface>();

  AuthServiceImpl();


  @override
  Future<Either<AppError, String>> signup(UserSignUpModel body) async {
    Map<String, dynamic> payload = body.toJson();
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.stagingBaseUrl}signup', payload);
      if (raw['success']) {
        AuthResponseModel res =   AuthResponseModel.fromJson(raw);
        //save prospective id  so you use it to do other stuff if necessary

        prospectIsProvider.setProspectId(raw['prospectId']);
        return Right(res.data.prospectId);
      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }


  Future<Either<AppError, String>> verifySignUpOtp(String otp) async {

    String prospectId= prospectIsProvider.getProspectId();
    Map<String, dynamic> payload = {"prospectId":prospectId,'otp': otp};
    try {

      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.stagingBaseUrl}otp', payload);
      if (raw['success']) {
        UserSignupDetails res = UserSignupDetails.fromMap(raw);
        //todo @felix save returned user
        localDbProvider.saveUser(res.data.user);
        return const Right("Sign up successful");
      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }


  @override
  Future<Either<AppError, String>> resendSignUpResetOtp(String phoneNumber) async {
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.stagingBaseUrl}resendOtp', phoneNumber);

      ResendOtpResponseModel res = ResendOtpResponseModel.fromJson(raw);
      if (raw['success']) {
        return Right(res.message);

      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    }on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }

  @override
  Future<Either<AppError, String>> login(String mobile, String password)async {
    Map<String, dynamic> payload = {"mobile":mobile,'password': password};

    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.stagingBaseUrl}signin', payload);
      UserSignupDetails res = UserSignupDetails.fromMap(raw);
      //todo @felix save login token to db here
      if (raw['success']) {
        return const Right("Login Successfull");

      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    }on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }



}
