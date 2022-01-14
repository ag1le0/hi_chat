import 'package:pea_chat/app/data/model/token_response.dart';
import 'package:pea_chat/app/data/model/user.dart';

class Session {
  Session._privateConstructor();

  static final Session _instance = Session._privateConstructor();

  static Session get instance => _instance;

  User? _user;

  TokenResp? _tokenResp;

  User? get user => _user;

  set user(User? value) {
    _user = value;
  }

  TokenResp? get tokenResp => _tokenResp;

  set tokenResp(TokenResp? value) {
    _tokenResp = value;
  }
}
