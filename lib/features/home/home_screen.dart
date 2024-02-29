import 'package:easac_task/core/resource_manager/routes.dart';
import 'package:easac_task/core/utils/app_size.dart';
import 'package:easac_task/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:easac_task/features/home/network_device_drop_down.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.defaultSize! * 5,
            ),
            CustomTextField(labelText: 'Enter URL', controller: controller),
            SizedBox(
              height: AppSize.defaultSize! * 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.webView,
                      arguments: WebViewModel(
                        url: controller.text,
                        title: '',
                      ));
                },
                child: const Text('Navigate To this URL')),
            SizedBox(
              height: AppSize.defaultSize! * 5,
            ),
            const NetworkDevicesDropdown(),
            const Spacer(),
            ElevatedButton(
                onPressed: () async {
                  bool logout = await signOutFromGoogle();
                  if (logout) {
                    Future.delayed(Duration.zero, () {
                      Navigator.pushNamed(
                        context,
                        Routes.login,
                      );
                    });
                  }
                },
                child: const Text('Logout')),
            SizedBox(
              height: AppSize.defaultSize! * 5,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
