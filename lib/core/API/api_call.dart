import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:trackizer/features/screens/home/home_subs_screen.dart';

class ApiService {
  static const String baseUrl =
      "https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1";

  static const Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'Content-Type': 'application/json',
  };

  static Future<Map<String, dynamic>> getUserStats() async {
    final url = Uri.parse("https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_statistics_summary");

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        return jsonData[0];
      } else {
        throw Exception(" لايوجد");
      }
    } else {
      throw Exception(
        " فشل في جلب بيانات : ${response.statusCode} - ${response.body}",
      );
    }
  }



   static Future<List<Subscription>> getSubscriptions() async {
    final url = Uri.parse("https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_subscriptions");

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Subscription.fromJson(e)).toList();
    } else {
      throw Exception("فشل في جلب الاشتراكات: ${response.statusCode}");
    }
  }

  // Spending
  static Future<List<Map<String, dynamic>>> getSpendingCategories() async {
    final url = Uri.parse("https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/spending_categories");

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
        print('Response body: ${response.body}');  // ← هنا

      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception(
        " فشل في جلب بيانات : ${response.statusCode} - ${response.body}",
      );
    }
  }

  //Sign Up
  static Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://ftcbwmmsnykncncsyrfs.supabase.co/auth/v1/signup');

    final response = await http.post(
      url,
      body: jsonEncode({'email': email, 'password': password}),
      headers: headers,
    );

    final Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      throw Exception(data['msg'] ?? 'Signup failed');
    }
  }

  //profile
  static Future<List<Map<String, dynamic>>> fetchProfileData() async {
    final url = Uri.parse('https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/profile');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('فشل في جلب البيانات');
    }
  }
}
