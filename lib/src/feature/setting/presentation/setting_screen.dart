import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/domain/usecase/auth_service.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/service/setting_service.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingService settingService = SettingService();

  @override
  void initState() {
    super.initState();
    settingService.addUserInfo();
  }

  final authService = AuthService();

  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: settingService.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Lỗi khi tải dữ liệu'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Center(
                    child: CircleAvatar(),
                  ),
                ),
                _buttonSetting(RoutePath.updateProfile, "Cập nhật hồ sơ"),
                snapshot.data!.isSeller == null ? _buttonSetting(RoutePath.shopRegister, "Đăng ký cửa hàng") : _buttonSetting(RoutePath.shop, "Cửa hàng"),
                _submitButton(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buttonSetting(String route, String lable) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(lable),
                const Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 0.5,
        ),
      ],
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: () {
          logout();
          Navigator.pushReplacementNamed(context, RoutePath.login);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Text(
            "Đăng xuất",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
