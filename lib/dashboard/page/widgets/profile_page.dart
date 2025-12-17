import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/dashboard/model/update_profile_model.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/app_widget.dart';
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
  String? userProfile = '';

  @override
  void initState() {
    super.initState();
    userProfile = HiveService().getData<String>(AppConfig.userImage);
    nameCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userName));
    emailCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userEmail));
    phoneNumberCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userMobile));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [
            customHeader(context, 'sep'.tr),
            Expanded(
              child: cardLayout(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.heightBox,
                        SlideFadeTransition(
                          index: 1,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: userProfile?.isNotEmpty ?? false
                                  ? Image.network(HiveService().getData<String>(AppConfig.userImage) ?? "", scale: 2.5)
                                  : FaIcon(FontAwesomeIcons.solidCircleUser, size: 42, color: AppColor.text),
                            ),
                          ),
                        ),
                        7.heightBox,
                        SlideFadeTransition(
                          index: 2,
                          child: Center(
                            child: Text(
                              HiveService().getData<String>(AppConfig.userEmail) ?? "",
                              style: textRoboto(context, fontSize: 15),
                            ),
                          ),
                        ),
                        SlideFadeTransition(
                          index: 2,
                          child: Center(
                            child: Text('ID: ${AppConfig.userProfileId}', style: subTextMontserrat(context, fontSize: 12)),
                          ),
                        ),
                        25.heightBox,
                        SlideFadeTransition(index: 3, child: Text('epn'.tr, style: subTextRoboto(context)).px(18)),
                        3.heightBox,
                        SlideFadeTransition(
                          index: 3,
                          child: CommonTextField(
                            hintText: "ex. John Smith",
                            controller: nameCtrl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "epne".tr;
                              }
                              return null;
                            },
                          ).px(15),
                        ),
                        13.heightBox,
                        SlideFadeTransition(index: 4, child: Text('epe'.tr, style: subTextRoboto(context)).px(18)),
                        3.heightBox,
                        SlideFadeTransition(
                          index: 4,
                          child: CommonTextField(
                            hintText: "ex. example123@gmail.com",
                            controller: emailCtrl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "epee".tr;
                              }
                              return null;
                            },
                          ).px(15),
                        ),
                        13.heightBox,
                        SlideFadeTransition(index: 5, child: Text('epp'.tr, style: subTextRoboto(context)).px(18)),
                        3.heightBox,
                        SlideFadeTransition(
                          index: 5,
                          child: CommonTextField(
                            hintText: "ex. +1 1234567890",
                            controller: phoneNumberCtrl,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'eppe'.tr;
                              }
                              return null;
                            },
                          ).px(15),
                        ),
                        30.heightBox,
                        SlideFadeTransition(
                          index: 6,
                          child: AppButton(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            color: AppColor.thirdCard,
                            onTap: () async {
                              FocusScope.of(context).unfocus();
        
                              if (formKey.currentState?.validate() == true) {
                                UpdateProfileModel updateProfileModel = await ApiRepo.updateProfile(
                                  email: emailCtrl.text.trim(),
                                  name: nameCtrl.text.trim(),
                                  mobile: phoneNumberCtrl.text.trim(),
                                  btcAddress: "",
                                  gender: "",
                                );
        
                                if (updateProfileModel.statusCode == '200') {
                                  HiveService().saveData(AppConfig.userEmail, updateProfileModel.email);
                                  HiveService().saveData(AppConfig.userName, updateProfileModel.name);
                                  HiveService().saveData(AppConfig.userMobile, updateProfileModel.mobile);
                                }
        
                                Navigation.pop();
                              }
                            },
                            text: 'epu'.tr,
                          ).px(15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }
}
