import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/common/response/common_response.dart';
import 'package:pea_chat/app/common/response/error_response.dart';
import 'package:pea_chat/app/common/response/list_response.dart';
import 'package:pea_chat/app/data/model/friend_request_response.dart';
import 'package:pea_chat/app/data/model/group_response.dart';
import 'package:pea_chat/app/data/model/message_response.dart';
import 'package:pea_chat/app/data/model/token_response.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/model/user_channel.dart';

class Api {
  static const String baseUrl = '$host/peachat';
  static const String host = "http://$hostClear:8988";
  static const String hostClear = "10.224.125.34";
  final _dio = Dio();

  Api._privateConstructor();

  static final Api _instance = Api._privateConstructor();

  static Api get instance => _instance;

  ///chat module
  Future<ListResponse<GroupResponse>?> groupList({bearToken}) async {
    try {
      var res = await _dio
          .get('$baseUrl/api/group/list',
              options: Options(headers: {
                'Authorization': 'Bearer $bearToken',
              }))
          .timeout(const Duration(seconds: 15));
      return ListResponse.fromJson(res.data,
          (data) => GroupResponse.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<GroupResponse>?> groupInfo(
      {bearToken, required int id}) async {
    try {
      var res = await _dio
          .get('$baseUrl/api/group/$id',
              options: Options(headers: {
                'Authorization': 'Bearer $bearToken',
              }))
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(res.data,
          (data) => GroupResponse.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<ListResponse<MessageResponse>?> getMessage({bearToken, params}) async {
    try {
      var res = await _dio
          .get('$baseUrl/api/group/message',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              queryParameters: params)
          .timeout(const Duration(seconds: 15));
      return ListResponse.fromJson(res.data,
          (data) => MessageResponse.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<ListResponse<bool>?> readMessage({bearToken, groupId}) async {
    try {
      var res = await _dio
          .post('$baseUrl/api/group/read-message',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              data: FormData.fromMap({'groupId': groupId}))
          .timeout(const Duration(seconds: 15));
      return ListResponse.fromJson(res.data, (data) => data as bool);
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<GroupResponse>?> createFriendChatRoom(
      {bearToken, idFriend}) async {
    try {
      var res = await _dio
          .post('$baseUrl/api/group/create-friend',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              data: FormData.fromMap({'friendId': idFriend}))
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(res.data,
          (data) => GroupResponse.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<MessageResponse>?> sendText({bearToken, data}) async {
    try {
      var res = await _dio
          .post('$baseUrl/api/group/send-text',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              data: data)
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(res.data,
          (data) => MessageResponse.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<MessageResponse>?> sendMedia({bearToken, data}) async {
    try {
      var res = await _dio
          .post('$baseUrl/api/group/send-media',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              data: data)
          .timeout(const Duration(seconds: 60));
      return CommonResponse.fromJson(res.data,
          (data) => MessageResponse.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<GroupResponse>?> createGroup({bearToken, data}) async {
    try {
      var res = await _dio
          .post('$baseUrl/api/group/create-normal',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              data: data)
          .timeout(const Duration(seconds: 20));
      return CommonResponse.fromJson(res.data,
          (data) => GroupResponse.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<ListResponse<User>?> groupMember(
      {bearToken, required int groupId}) async {
    try {
      var res = await _dio.get('$baseUrl/api/group/member/list',
          options: Options(
            headers: {
              'Authorization': 'Bearer $bearToken',
            },
          ),
          queryParameters: {
            'groupId': groupId
          }).timeout(const Duration(seconds: 20));
      return ListResponse.fromJson(
          res.data, (data) => User.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<ListResponse<User>?> searchUser({bearToken, query}) async {
    try {
      var res = await _dio
          .post('$baseUrl/api/user/search',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              data: query)
          .timeout(const Duration(seconds: 30));
      return ListResponse.fromJson(
          res.data, (data) => User.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  ///channel manager
  Future<CommonResponse<UserChannel>?> registerChannel(
      {bearToken, data}) async {
    try {
      var res = await _dio
          .post('$baseUrl/api/user/channel/register',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              queryParameters: data)
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(res.data,
          (data) => UserChannel.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<bool>?> unregisterChannel({bearToken, param}) async {
    try {
      log('#######' + param.toString());
      log('#######' + bearToken);
      var res = await _dio
          .post('$baseUrl/api/user/channel/unregister',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              queryParameters: param)
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(res.data, (data) => data as bool);
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  ///friend manager
  Future<ListResponse<User>?> getFriendList({bearToken}) async {
    try {
      var res = await _dio
          .get('$baseUrl/api/user/friend',
              options: Options(headers: {
                'Authorization': 'Bearer $bearToken',
              }))
          .timeout(const Duration(seconds: 15));
      return ListResponse.fromJson(
          res.data, (data) => User.fromJson(data as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<int>?> addFriendRequestNumber({bearToken}) async {
    try {
      var res = await _dio
          .get('$baseUrl/api/user/add-friend-request-number',
              options: Options(headers: {
                'Authorization': 'Bearer $bearToken',
              }))
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(res.data, (result) => result as int);
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  ///authentication
  Future<TokenResp?> getToken(
      {required String grantType,
      required String userName,
      required String password,
      required String mac,
      required String otp}) async {
    try {
      log({
        "username": userName,
        "password": password,
        "uuid": mac,
      }.toString());
      var response = await _dio
          .post(
            '$baseUrl/api/user/sign-in',
            options: Options(
              headers: <String, String>{
                'Content-Type': 'application/x-www-form-urlencoded',
                'Authorization': 'Basic d3Mtc3lzdGVtOkZveGNvbm4xNjghIQ==',
              },
            ),
            data: FormData.fromMap({
              "username": userName,
              "password": password,
              "uuid": mac,
              "grant_type": grantType,
            }),
          )
          .timeout(Duration(seconds: 15));
      return TokenResp.fromJson(response.data);
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<User>?> getLoginInfo({bearToken}) async {
    try {
      var response = await _dio
          .get(
            '$baseUrl/api/user/me',
            options: Options(
              headers: {
                'Authorization': 'Bearer $bearToken',
              },
            ),
          )
          .timeout(Duration(seconds: 15));
      log(response.data.toString());
      return CommonResponse.fromJson(response.data,
          (result) => User.fromJson(result as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<bool>?> changePass(
      String bearToken, String oldPass, String newPass) async {
    try {
      var response = await _dio.post('$baseUrl/api/user/change-password',
          options: Options(headers: {
            'Authorization': 'Bearer $bearToken',
          }),
          queryParameters: {
            "oldPassword": oldPass,
            "newPassword": newPass,
          }).timeout(Duration(seconds: 15));
      return CommonResponse.fromJson(response.data, (result) => result as bool);
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<User>?> getUserInfo(
      {bearToken, required int id}) async {
    try {
      var response = await _dio
          .get(
            '$baseUrl/api/user/$id',
            options: Options(
              headers: {
                'Authorization': 'Bearer $bearToken',
              },
            ),
          )
          .timeout(Duration(seconds: 15));
      log(response.data.toString());
      return CommonResponse.fromJson(response.data,
          (result) => User.fromJson(result as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<dynamic>?> uploadAvatar({bearToken, file}) async {
    var formData = FormData();

    formData.files.add(MapEntry(
        'avatar',
        await MultipartFile.fromFile(
          file.path,
        )));
    try {
      var response = await _dio
          .post('$baseUrl/api/user/update',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $bearToken',
                },
              ),
              data: formData)
          .timeout(Duration(seconds: 15));
      log(response.data.toString());
      return CommonResponse.fromJson(response.data,
          (result) => User.fromJson(result as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<FriendRequestResponse?>?> sendAddFriendRequest(
      {bearToken, required int friendId}) async {
    try {
      var response = await _dio.post('$baseUrl/api/user/add-friend',
          options: Options(
            headers: {
              'Authorization': 'Bearer $bearToken',
            },
          ),
          data: {'friendId': friendId}).timeout(Duration(seconds: 15));
      return CommonResponse.fromJson(
          response.data,
          (json) =>
              FriendRequestResponse.fromJson(json as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<ListResponse<FriendRequestResponse>?> addFriendRequestList({
    bearToken,
  }) async {
    try {
      var response = await _dio
          .get(
            '$baseUrl/api/user/add-friend-request-list',
            options: Options(
              headers: {
                'Authorization': 'Bearer $bearToken',
              },
            ),
          )
          .timeout(const Duration(seconds: 15));
      return ListResponse.fromJson(
          response.data,
          (json) =>
              FriendRequestResponse.fromJson(json as Map<String, dynamic>));
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<bool>?> acceptFriendRequest(
      {bearToken, required int requestId}) async {
    try {
      var response = await _dio
          .post(
            '$baseUrl/api/user/accept-friend/$requestId',
            options: Options(
              headers: {
                'Authorization': 'Bearer $bearToken',
              },
            ),
          )
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(response.data, (json) => json as bool);
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  Future<CommonResponse<bool>?> rejectFriendRequest(
      {bearToken, required int requestId}) async {
    try {
      var response = await _dio
          .post(
            '$baseUrl/api/user/reject-friend/$requestId',
            options: Options(
              headers: {
                'Authorization': 'Bearer $bearToken',
              },
            ),
          )
          .timeout(const Duration(seconds: 15));
      return CommonResponse.fromJson(response.data, (json) => json as bool);
    } on DioError catch (dioEx) {
      _catchDioEx(dioEx);
    }
  }

  // Future<CheckVersionResponse?> getAppVerson({appName}) async {
  //   try {
  //     var response = await _dio
  //         .get(
  //           '$HOST/fiistore/getVersion?appName=$appName',
  //         )
  //         .timeout(Duration(seconds: 15));
  //     return CheckVersionResponse.fromJson(response.data);
  //   } on DioError catch (dioEx) {
  //     _catchDioEx(dioEx);
  //   }
  // }

  // Future<CommonResponse?> changePass(
  //     String bearToken, String oldPass, String newPass) async {
  //   try {
  //     log('toke = $bearToken');
  //     var response = await _dio.post('$HOST/peachat/api/user/change-password',
  //         options: Options(headers: {
  //           'Authorization': 'Bearer $bearToken',
  //         }),
  //         queryParameters: {
  //           "oldPassword": oldPass,
  //           "newPassword": newPass,
  //         }).timeout(Duration(seconds: 15));
  //     return CommonResponse.fromJson(response.data);
  //   } on DioError catch (dioEx) {
  //     _catchDioEx(dioEx);
  //   }
  // }

  // Future<CommonResponse?> changePass(
  //     String username, String oldPass, String newPass) async {
  //   try {
  //     var payload = {
  //       "username": username,
  //       "oldPassword": oldPass,
  //       "newPassword": newPass,
  //     };
  //     var response = await _dio
  //         .post('$host/oauth-service/oauth/user/change-password',
  //             data: payload,
  //             options: Options(
  //                 contentType:
  //                     'application/x-www-form-urlencoded; charset=UTF-8'))
  //         .timeout(Duration(seconds: 15));
  //     return CommonResponse.fromJson(response.data);
  //   } on DioError catch (dioEx) {
  //     _catchDioEx(dioEx);
  //   }
  // }
  //
  // Future<dynamic> getOTPForgotPass(String userName, String grantType) async {
  //   Map<String, String> queryParams = {
  //     "username": userName,
  //     "grantType": grantType,
  //   };
  //   log(queryParams.toString());
  //
  //   try {
  //     var response = await _dio
  //         .get('$host/oauth-service/api/user/forgot-password',
  //             queryParameters: queryParams)
  //         .timeout(Duration(seconds: 15));
  //     return response.data;
  //   } on DioError catch (dioEx) {
  //     _catchDioEx(dioEx);
  //   }
  // }
  //
  // Future<dynamic> forgotPass(
  //     String userName, String password, String otp) async {
  //   try {
  //     var response = await _dio
  //         .get(
  //           '$host/oauth-service/api/user/forgot-password',
  //         )
  //         .timeout(Duration(seconds: 15));
  //     return response.data;
  //   } on DioError catch (dioEx) {
  //     _catchDioEx(dioEx);
  //   }
  // }

  ///utils

  void _catchDioEx(DioError dioEx) {
    log(dioEx.toString());
    if (dioEx.error is SocketException) {
      throw FetchDataException('No Internet connection');
    } else {
      _responseException(dioEx.response!);
    }
  }

  dynamic _responseException(Response response) {
    log(response.toString());
    switch (response.statusCode) {
      case 400:
        {
          if (response.data != null) {
            if (response.data['message'] != null) {
              var temp =
                  CommonResponse.fromJson(response.data, (value) => value);
              throw BadRequestException(temp.message);
            } else if (response.data['error'] != null) {
              var temp = ErrorResponse.fromJson(response.data);
              log(temp.errorDescription!);
              throw BadRequestException(temp.errorDescription);
            }
          }
          throw BadRequestException(response);
        }
      case 401:
      case 403:
        {
          if (response.data != null) {
            if (response.data['message'] != null) {
              var temp =
                  CommonResponse.fromJson(response.data, (result) => result);
              throw UnauthorisedException(temp.message);
            } else if (response.data['error'] != null) {
              var temp = ErrorResponse.fromJson(response.data);
              log(temp.errorDescription!);
              throw UnauthorisedException(temp.errorDescription);
            }
          }
          throw UnauthorisedException(response);
        }
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
