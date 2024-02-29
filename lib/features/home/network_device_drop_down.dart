import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easac_task/core/resource_manager/colors.dart';
import 'package:easac_task/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class NetworkDevicesDropdown extends StatefulWidget {
  const NetworkDevicesDropdown({super.key});

  @override
  NetworkDevicesDropdownState createState() => NetworkDevicesDropdownState();
}

class NetworkDevicesDropdownState extends State<NetworkDevicesDropdown> {
  String? selectedDevice;
  List<String> networkDevices = ['Wi-Fi', 'Bluetooth', 'Printer'];

  @override
  Widget build(BuildContext context) {
    return      Container(
      height: AppSize.defaultSize! * 5,
      decoration: BoxDecoration(
          border:
          Border.all(color: AppColors.greyColor.withOpacity(.4)),
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * .5)),
      child: DropdownButton2<String>(
        value: selectedDevice,
        buttonStyleData: ButtonStyleData(
          width: AppSize.screenWidth! * .9,
        ),
        dropdownStyleData: DropdownStyleData(
            width: AppSize.screenWidth! * .9,
            // padding: EdgeInsets.symmetric(horizontal: 10),
            maxHeight: AppSize.screenHeight! * .5),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
         selectedDevice = newValue;
          });
        },
        hint: Padding(
          padding: EdgeInsets.only(left: AppSize.defaultSize!),
          child: Text(
            'Select device',
            style: TextStyle(
              fontSize: AppSize.defaultSize!*1.2,
            ),
          ),
        ),
        items:networkDevices
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: AppSize.defaultSize!),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: AppSize.defaultSize!*1.2,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
