import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../controller/legal_controller.dart';
import '../../../utils/app_colors.dart';
import '../app_bar/custom_app_bar.dart';
import '../back/back.dart';
import 'flutter_content.dart';

class ContentScreen extends StatelessWidget {
  ContentScreen({super.key});

  LegalController legalController = Get.put(LegalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
      body: CustomContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Obx(() => legalController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Html(
                      data: legalController
                          .contentModelInfo?.data?.attributes?.content
                          .toString() ?? "No Data Found",
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
