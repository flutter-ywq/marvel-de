import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

/// @description 加密工具
///
/// @author 燕文强
///
/// @date 2019-09-09
class EncryptUtils {
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}
