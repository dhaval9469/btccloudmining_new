
import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:btccloudmining/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  final csFormKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userName));
  TextEditingController emailCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userEmail));
  TextEditingController massageCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [
            customHeader(context, 'scs'.tr),
            Expanded(
              child: cardLayout(
                child: SingleChildScrollView(
                  child: Form(
                    key: csFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.heightBox,
                        Text('Name', style: subTextRoboto(context)).px(18),
                        3.heightBox,
                        CommonTextField(
                          hintText: "ex. John Smith",
                          controller: nameCtrl,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Name is required.";
                            }
                            return null;
                          },
                        ).px(15),
                        10.heightBox,
                        Text('Email', style: subTextRoboto(context)).px(18),
                        3.heightBox,
                        CommonTextField(
                          hintText: "ex. example123@.com",
                          controller: emailCtrl,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required.";
                            }
                            return null;
                          },
                        ).px(15),
                        10.heightBox,
                        Text('Your Massage', style: subTextRoboto(context)).px(18),
                        3.heightBox,
                        CommonTextField(
                          hintText: "Type your message here...",
                          controller: massageCtrl,
                          maxLines: 4,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "message is required.";
                            }
                            return null;
                          },
                        ).px(15),
                        30.heightBox,
                        AppButton(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          color: AppColor.thirdCard,
                          onTap: () async {
                            try {
                              if (csFormKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();

                                final email = Email(
                                  body: 'name: ${nameCtrl.text},\nemail: ${emailCtrl.text},\nmessage: ${massageCtrl.text}',
                                  subject:
                                      'App: ${AppConfig.appName}, Version: ${AppConfig.appVersion}, email: ${emailCtrl.text}',
                                  recipients: [AppConfig.appDataSet?.contactEmail ?? ''],
                                  isHTML: false,
                                );

                                await FlutterEmailSender.send(email);
                              }
                            } catch (e) {
                              debugPrint('Email send error: $e');
                            }
                          },
                          text: 'css'.tr,
                        ).px(15),
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
