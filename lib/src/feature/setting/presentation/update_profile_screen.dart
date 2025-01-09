import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/service/setting_service.dart';
import 'package:fresh_fashion_mobile/src/feature/setting/service/user_info_update_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final settingService = SettingService();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  Future<void> updateProfile() async {
    UserInfoUpdateModel userInfoUpdateModel = UserInfoUpdateModel(
      fullname: fullnameController.text,
      phoneNumber: phonenumberController.text,
      gender: genderController.text,
    );
    settingService.updateProfile(userInfoUpdateModel);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cập nhật hồ sơ"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: settingService.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Lỗi khi tải dữ liệu'));
          } else {
            final data = snapshot.data!;

            if (data.fullname != null) {
              fullnameController.text = data.fullname!;
            }

            if (data.phoneNumber != null) {
              phonenumberController.text = data.phoneNumber!;
            }

            if (data.gender != null) {
              genderController.text = data.gender!;
            }

            return Column(
              children: [
                _profileWidget("Họ và Tên", fullnameController),
                _profileWidget("Số điện thoại", phonenumberController),
                _profileWidget("Giới tính", genderController),
                _submitButton(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _profileWidget(String lable, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: updateProfile,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Text(
            "Cập nhật",
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
