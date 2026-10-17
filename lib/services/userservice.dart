
import 'dart:convert';

import 'package:peedika/models/LoginResp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  // UserService._();
  //
  // static final UserService instance = UserService._();

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _customerKey = 'customer';

  // Save login response
  Future<bool> saveUser(LoginResp response) async {
    if (response.success != true || response.data == null) {
      return false;
    }

    final data = response.data!;
    final accessToken = data.accessToken;

    if (accessToken == null || accessToken.isEmpty) {
      return false;
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_accessTokenKey, accessToken);

    if (data.refreshToken != null) {
      await prefs.setString(
        _refreshTokenKey,
        data.refreshToken!,
      );
    } else {
      await prefs.remove(_refreshTokenKey);
    }

    if (data.customer != null) {
      await prefs.setString(
        _customerKey,
        jsonEncode(data.customer!.toJson()),
      );
    } else {
      await prefs.remove(_customerKey);
    }

    return true;
  }

  // Get access token
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  // Get refresh token
  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  // Get customer details
  Future<Customer?> getCustomer() async {
    final prefs = await SharedPreferences.getInstance();
    final customerJson = prefs.getString(_customerKey);

    if (customerJson == null) {
      return null;
    }

    try {
      return Customer.fromJson(jsonDecode(customerJson));
    } catch (_) {
      return null;
    }
  }

  // Check whether the user has a saved session
  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  // Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_customerKey);
  }
}
