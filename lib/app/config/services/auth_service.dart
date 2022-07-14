import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/config/exceptions/auth_exceptions.dart';
import 'package:jekawin_mobile_flutter/app/config/services/di/di_locator.dart';
import 'package:jekawin_mobile_flutter/app/config/services/http/base_urls.dart';
import 'package:jekawin_mobile_flutter/app/constants/app_error.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/auth_response.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/forget_password_response.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/forgot_password_otp_res.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/user_singed_up_response.dart';
import '../../constants/network_exceptions.dart';
import '../../modules/edit_profile/models/add_email_response_model.dart';
import 'package:dio/dio.dart';
import '../../modules/edit_profile/models/verified_email_response_model.dart';
import '../../modules/signup/models/resendotp_resonse_model.dart';
import '../../modules/signup/models/user_sign_up_model.dart';
import '../../services/base_service.dart';
import '../data/local/user_local_impl.dart';
import 'http/http_services.dart';

abstract class AuthServiceDataSource {
  Future<Either<AppError, String>> signup(UserSignUpModel body);

  Future<Either<AppError, String>> verifySignUpOtp(String otp);

  Future<Either<AppError, String>> login(String mobile, String password);

  Future<Either<String, UserSignupResponse>> signIn(
      String mobile, String password);

  Future<Either<AppError, String>> resendSignUpResetOtp(String phoneNumber);

  Future<Either<AppError, String>> forgetPassword(String mobile);

  Future<Either<AppError, String>> verifyResetPasswordOtp(String Otp);

  Future<Either<AppError, String>> updatePassword(String password);

  Future<Either<AppError, String>> signout();
}

class AuthServiceImpl extends AuthServiceDataSource {
  final httpProvider = Get.find<HttpService>();
  final utilsProvider = Get.find<UtilsController>();
  final UserLocalDataSourceImpl _userLocalDataSource =
      Get.find<UserLocalDataSourceImpl>();
  BaseService service = BaseService();

  // User? get user => _userLocalDataSource.user;

  @override
  Future<Either<AppError, String>> signup(UserSignUpModel body) async {
    Map<String, dynamic> payload = {
      'firstName': body.firstName,
      'lastName': body.lastName,
      'phone': body.phone,
      'password': body.password,
      'agreement': body.agreement,
    };
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}signup', payload);
      if (raw['success']) {
        AuthResponseModel res = AuthResponseModel.fromJson(raw);
        utilsProvider.setProspectId(res.body.reference);
        utilsProvider.setPhoneNumber(body.phone);
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
    String prospectId = utilsProvider.getProspectId();
    Map<String, dynamic> payload = {'reference': prospectId, 'otp': otp};
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}verify-signup-otp', payload);
      UserSignupResponse res = UserSignupResponse.fromMap(raw);
      // _userLocalDataSource.saveUser(res.body.user);
      GetStorage().write('firstName', res.body.user.firstName);
      GetStorage().write('lastName', res.body.user.lastName);
      GetStorage().write('phoneNumber', res.body.user.phone);
      GetStorage().write('profileImage', res.body.user.profileUrl);
      GetStorage().write('referralCode', "inviteLink");
      GetStorage().write('token', res.body.token);
      GetStorage().write('currentUserID', res.body.user.id);

      if (raw['success']) {
        if (kDebugMode) {
          print(
              '----> ${res.body.user.firstName}, ${res.body.user.lastName}, ${res.body.user.phone}, ${res.body.user.profileUrl}, ');
        }
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
  Future<Either<String, UserSignupResponse>> signIn(
      String mobile, String password) async {
    Map<String, dynamic> payload = {'phone': mobile, 'password': password};
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}signin', payload);
      UserSignupResponse res = UserSignupResponse.fromMap(raw);
      // _userLocalDataSource.saveUser(res.body.user);
      GetStorage().write('firstName', res.body.user.firstName);
      GetStorage().write('lastName', res.body.user.lastName);
      GetStorage().write('profileImage', res.body.user.profileUrl);
      GetStorage().write('phoneNumber', res.body.user.phone);
      GetStorage().write('token', res.body.token);
      GetStorage().write('referralCode', "inviteLink");
      GetStorage().write('isEmailVerified', res.body.user.isEmailVerified);
      GetStorage().write('currentUserID', res.body.user.id);
      GetStorage().write('email', res.body.user.email);
      GetStorage().write('isEmailVerified', res.body.user.isEmailVerified);

      if (raw['success']) {
        return Right(res);
      } else {
        return Left(raw['message']);
      }
    } on NetworkException catch (e) {
      return const Left("Something went wrong check connection and try again");
    } on SocketException catch (e) {
      return const Left("Something went wrong check connection and try again");
    } on AuthException catch (e){
      return  Left(e.message);
    }
    on Exception {
      return const Left("Something went wrong signing you in and try again");
    }
  }

  @override
  Future<Either<AppError, String>> login(String mobile, String password) async {
    Map<String, dynamic> payload = {'phone': mobile, 'password': password};
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}signin', payload);
      UserSignupResponse res = UserSignupResponse.fromMap(raw);
      // _userLocalDataSource.saveUser(res.body.user);
      GetStorage().write('firstName', res.body.user.firstName);
      GetStorage().write('lastName', res.body.user.lastName);
      GetStorage().write('profileImage', res.body.user.profileUrl);
      GetStorage().write('phoneNumber', res.body.user.phone);
      GetStorage().write('token', res.body.token);
      GetStorage().write('referralCode', "inviteLink");
      GetStorage().write('isEmailVerified', res.body.user.isEmailVerified);
      GetStorage().write('currentUserID', res.body.user.id);
      GetStorage().write('email', res.body.user.email);
      GetStorage().write('isEmailVerified', res.body.user.isEmailVerified);
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
      if (raw['success']) {
        ForgetPasswordResponse res = ForgetPasswordResponse.fromMap(raw);
        utilsProvider.setProspectId(res.data.prospectId);
        utilsProvider.setOtp(res.data.otp);

        utilsProvider.setPhoneNumber(mobile);

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
  Future<Either<AppError, String>> verifyResetPasswordOtp(String Otp) async {
    String prospectId = utilsProvider.getProspectId();
    Map<String, dynamic> payload = {"prospectId": prospectId, 'otp': Otp};

    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}forgetpassword_otp', payload);
      if (raw['success']) {
        ForgetPasswordOtpResponse res = ForgetPasswordOtpResponse.fromMap(raw);
        utilsProvider.setForgotPasswordToken(res.token);

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
    String tokenProvider = utilsProvider.getForgotPasswordToken();
    Map<String, dynamic> token = {
      "token": tokenProvider,
    };
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.authBaseUrl}resetpassword/$tokenProvider', payload,
          params: token);
      if (raw['success']) {
        return const Right("Password reset successful");
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
  Future<Either<AppError, String>> signout() async {
    GetStorage().write("token", "");
    try {
      var raw = await httpProvider.deleteHttp(
        '${JekawinBaseUrls.authBaseUrl}signout',
      );
      if (raw['success']) {
        return const Right("Logout Successful");
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

  addEmail(String email) async {
    Map<String, dynamic> payload = {'email': email};
    var currentUserID = GetStorage().read('currentUserID');
    try {
      var raw = await httpProvider.postHttp(
        '${JekawinBaseUrls.authBaseUrl}users/$currentUserID/add-email',
        payload,
      );
      AddEmailResponseModel res = AddEmailResponseModel.fromJson(raw);
      utilsProvider.setProspectId(res.body.reference);
      if (raw['success']) {
        return const Right("Success");
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

  verifyEmailOtp(String otp) async {
    String prospectId = utilsProvider.getProspectId();
    var currentUserID = GetStorage().read('currentUserID');
    Map<String, dynamic> payload = {'reference': prospectId, 'otp': otp};
    try {
      var raw = await httpProvider.postHttp(
        '${JekawinBaseUrls.authBaseUrl}users/$currentUserID/verify-email-token',
        payload,
      );
      VerifiedEmailResponse res = VerifiedEmailResponse.fromMap(raw);
      utilsProvider.setProspectId(res.body.email);
      if (raw['success']) {
        return const Right("Success");
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
}
