import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/service/user_info_model.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/service/user_info_update_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final authService = AuthService();

  Future<UserInfoModel> getUserProfile() async {
    addUserInfo();
    final userId = authService.getCurrentUserId();
    final data = await _supabase.from('user_info_table').select().eq('userId', userId!).maybeSingle();
    final response = UserInfoModel.fromJson(data!);
    return response;
  }

  Future<int?> getUserProfileId() async {
    final userId = authService.getCurrentUserId();
    final data = await _supabase.from('user_info_table').select().eq('userId', userId!).maybeSingle();
    final response = UserInfoModel.fromJson(data!);
    return response.id;
  }

  Future<void> updateProfile(UserInfoUpdateModel userInfo) async {
    final data = userInfo.toJson();
    final userId = authService.getCurrentUserId();
    await _supabase.from('user_info_table').update(data).eq('userId', userId!);
  }

  Future<void> addUserInfo() async {
    final userId = authService.getCurrentUserId();
    final data = await _supabase.from('user_info_table').select().eq('userId', userId!).maybeSingle();
    if (data != null) {
      return;
    }
    await _supabase.from('user_info_table').insert({'userId', userId});
  }

  Future<void> shopRegister(String name) async {
    final userId = authService.getCurrentUserId();
    final userProfileId = await getUserProfileId();
    await _supabase.from('shop_table').insert({
      'name': name,
      'ownerId': userProfileId,
      'userId': userId,
    });
    await _supabase.from('user_info_table').update({'isSeller': 'yes'}).eq('userId', userId!);
  }
}
