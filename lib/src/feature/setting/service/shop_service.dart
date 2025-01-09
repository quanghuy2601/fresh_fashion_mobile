import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ShopService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final authService = AuthService();

  Future<void> addProduct() async {
    //
  }
}
