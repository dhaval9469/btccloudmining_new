import 'dart:io';

import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:btccloudmining/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  final csFormKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController(
    text: HiveService().getData<String>(AppConfig.userName),
  );
  TextEditingController emailCtrl = TextEditingController(
    text: HiveService().getData<String>(AppConfig.userEmail),
  );
  TextEditingController massageCtrl = TextEditingController();
  final ImagePicker picker = ImagePicker();
  List<XFile>? pickedCSImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'scs'.tr),
      body: SingleChildScrollView(
        child: Form(
          key: csFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.heightBox,
              Text('Name', style: subTextRoboto(context)).px(18),
              3.heightBox,
              CommonTextField(
                hintText: "ex. jone smith",
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
              10.heightBox,
              Text('Attachment', style: subTextRoboto(context)).px(18),
              3.heightBox,
              GestureDetector(
                onTap: () => pickImages(),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.primaryCard,
                    border: Border.all(color: AppColor.secondaryCard.withAlpha(150)),
                  ),
                  child: pickedCSImages?.isEmpty ?? false
                      ? Icon(
                          FontAwesomeIcons.fileCirclePlus,
                          size: 28,
                          color: AppColor.secondaryCard.withAlpha(150),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: pickedCSImages!.map((image) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: FileImage(File(image.path)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                ),
              ).px(15),
              25.heightBox,
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 7),
                color: AppColor.primary,
                onTap: () async {
                  try {
                    if (csFormKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();

                      final email = Email(
                        body:
                            'name: ${nameCtrl.text},\nemail: ${emailCtrl.text},\nmessage: ${massageCtrl.text}',
                        subject: 'App: ${AppConfig.appName}, Version: ${AppConfig.appVersion}, email: ${emailCtrl.text}',
                        recipients: [AppConfig.appDataSet?.contactEmail ?? ''],
                        attachmentPaths: pickedCSImages?.map((e) => e.path).toList(),

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
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }

  Future<void> pickImages() async {
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
        pickedCSImages = images;
      });
    }
  }
}
