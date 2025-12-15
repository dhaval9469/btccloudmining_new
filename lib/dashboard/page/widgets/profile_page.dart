import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/dashboard/model/update_profile_model.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:btccloudmining/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneNumberCtrl;
  late TextEditingController btcWalletIDCtrl;
  String? userProfile = '';
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    userProfile = HiveService().getData<String>(AppConfig.userImage);
    nameCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userName));
    emailCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userEmail));
    phoneNumberCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userMobile));
    btcWalletIDCtrl = TextEditingController(
      text: HiveService().getData<String>(AppConfig.userBtcAddress),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'sp'.tr),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: userProfile?.isNotEmpty ?? false
                      ? Image.network(HiveService().getData<String>(AppConfig.userImage) ?? "", scale: 2)
                      : FaIcon(FontAwesomeIcons.solidCircleUser, size: 48, color: AppColor.white),
                ),
              ),
              7.heightBox,
              Center(
                child: Text(
                  HiveService().getData<String>(AppConfig.userEmail) ?? "",
                  style: textRoboto(context, fontSize: 15),
                ),
              ),
              Center(
                child: Text(
                  'ID: ${AppConfig.userProfileId}',
                  style: subTextMontserrat(context, fontSize: 12),
                ),
              ),
              25.heightBox,
              Text('Name', style: subTextRoboto(context)).px(18),
              3.heightBox,
              CommonTextField(
                hintText: "pnHint".tr,
                controller: nameCtrl,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "pnError".tr;
                  }
                  return null;
                },
              ).px(15),
              10.heightBox,
              Text('Email', style: subTextRoboto(context)).px(18),
              3.heightBox,
              CommonTextField(
                hintText: "ex. example123@gmail.com",
                controller: emailCtrl,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "peError".tr;
                  }
                  return null;
                },
              ).px(15),
              10.heightBox,
              Text('Phone Number', style: subTextRoboto(context)).px(18),
              3.heightBox,
              CommonTextField(
                hintText: "ex. +1 1234567890",
                controller: phoneNumberCtrl,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'pmnumberError'.tr;
                  }
                  return null;
                },
              ).px(15),
              10.heightBox,
              Text('BTC Wallet Address', style: subTextRoboto(context)).px(18),
              3.heightBox,
              CommonTextField(
                hintText: "Enter Wallet Address",
                controller: btcWalletIDCtrl,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "pwaError".tr;
                  }
                  return null;
                },
              ).px(15),
              25.heightBox,
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 7),
                color: AppColor.primary,
                onTap: () async {
                  FocusScope.of(context).unfocus();

                  if (formKey.currentState?.validate() == true) {
                    UpdateProfileModel updateProfileModel = await ApiRepo.updateProfile(
                      email: emailCtrl.text.trim(),
                      name: nameCtrl.text.trim(),
                      btcAddress: btcWalletIDCtrl.text.trim(),
                      mobile: phoneNumberCtrl.text.trim(),
                      gender: "",
                    );

                    if (updateProfileModel.statusCode == '200') {
                      HiveService().saveData(AppConfig.userEmail, updateProfileModel.email);
                      HiveService().saveData(AppConfig.userName, updateProfileModel.name);
                      HiveService().saveData(AppConfig.userBtcAddress, updateProfileModel.btcAddress);
                      HiveService().saveData(AppConfig.userGender, updateProfileModel.gender);
                      HiveService().saveData(AppConfig.userMobile, updateProfileModel.mobile);
                    }

                    AppConfig.bottomBarValue.value = 3;
                    Navigation.pop();
                  }
                },
                text: 'pub'.tr,
              ).px(15),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }
}
