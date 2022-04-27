import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/config/services/di/di_locator.dart';
import 'package:jekawin_mobile_flutter/app/config/services/http/base_urls.dart';
import 'package:jekawin_mobile_flutter/app/constants/app_error.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/auth_response.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/forget_password_response.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/forgot_password_otp_res.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/user_singed_up_response.dart';
import '../../constants/network_exceptions.dart';
import '../../modules/signup/models/resendotp_resonse_model.dart';
import '../../modules/signup/models/user_sign_up_model.dart';
import '../../modules/signup_verification/views/mobile/signup_verification_mobile_portrait.dart';
import '../data/local/user_local_impl.dart';
import '../data/model/user.dart';
import 'http/http_services.dart';

//chibueze felix 3-2022

abstract class AuthServiceDataSource {
  Future<Either<AppError, String>> signup(UserSignUpModel body);
  Future<Either<AppError, String>> verifySignUpOtp(String otp);
  Future<Either<AppError, String>> login(String mobile, String password);
  Future<Either<AppError, String>> resendSignUpResetOtp(String phoneNumber);
  Future<Either<AppError, String>> forgetPassword(String mobile);
  Future<Either<AppError, String>> resetPasswordOtp(String Otp);
  Future<Either<AppError, String>> updatePassword(String password);
  Future<Either<AppError, String>> signout();
}

class AuthServiceImpl extends AuthServiceDataSource {
  final httpProvider = Get.find<HttpService>();
  final prospectIsProvider = Get.find<ProspectIdController>();
  final UserLocalDataSourceImpl _userLocalDataSource =
      Get.find<UserLocalDataSourceImpl>();
  User? get user => _userLocalDataSource.user;

  @override
  Future<Either<AppError, String>> signup(UserSignUpModel body) async {
    Map<String, dynamic> payload = {
      'firstname': body.firstname,
      'lastname': body.lastname,
      'mobile': body.mobile,
      'password': body.password,
      'agreement': body.agreement,
    };
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}signup', payload);
      if (raw['success']) {
        AuthResponseModel res = AuthResponseModel.fromJson(raw);
        prospectIsProvider.setProspectId(res.data.prospectId);
        prospectIsProvider.setPhoneNumber(body.mobile);
        return Right(raw['message']);
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
  Future<Either<AppError, String>> verifySignUpOtp(String otp) async {
    String prospectId = prospectIsProvider.getProspectId();
    Map<String, dynamic> payload = {'prospectId': prospectId, 'otp': otp};
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}otp', payload);
      if (raw['success']) {
        UserSignupDetails res = UserSignupDetails.fromMap(raw);
        _userLocalDataSource.saveUser(res.data.user);
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
  Future<Either<AppError, String>> resendSignUpResetOtp(
      String phoneNumber) async {
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}resendOtp', phoneNumber);

      ResendOtpResponseModel res = ResendOtpResponseModel.fromJson(raw);
      if (raw['success']) {
        return Right(res.message);
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
  Future<Either<AppError, String>> login(String mobile, String password) async {
    Map<String, dynamic> payload = {'mobile': mobile, 'password': password};
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}signin', payload);
      UserSignupDetails res = UserSignupDetails.fromMap(raw);
      _userLocalDataSource.saveUser(res.data.user);
      GetStorage().write('firstName', res.data.user.firstName);
      if (raw['success']) {
        return const Right("Login Successful");
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
  Future<Either<AppError, String>> forgetPassword(String mobile) async {
    Map<String, dynamic> payload = {"mobile": mobile};

    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}forgetpassword', payload);
      //todo @felix get prospectId here
      if (raw['success']) {
        ForgetPasswordResponse res = ForgetPasswordResponse.fromMap(raw);
        prospectIsProvider.setProspectId(raw['prospectId']);

        return const Right("Otp sent Successful for password reset");
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
  Future<Either<AppError, String>> resetPasswordOtp(String Otp) async {
    String prospectId = prospectIsProvider.getProspectId();
    Map<String, dynamic> payload = {"prospectId": prospectId, 'Otp': Otp};

    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}forgetpassword_otp', payload);
      //todo @felix
      if (raw['success']) {
        ForgetPasswordOtpResponse res = ForgetPasswordOtpResponse.fromMap(raw);
        return Right(res.message);
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
  Future<Either<AppError, String>> updatePassword(String password) async {
    Map<String, dynamic> payload = {"password": password};

    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}createpassword', payload);
      UserSignupDetails res = UserSignupDetails.fromMap(raw);
      //todo @felix
      if (raw['success']) {
        return const Right("Login Successful");
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
  Future<Either<AppError, String>> signout() {
    // TODO: Felix implement signout
    throw UnimplementedError();
  }
}
