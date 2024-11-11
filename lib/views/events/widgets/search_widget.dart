import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/controllers/event_controller.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/core/utils/screen_width.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isSearch = false;
  final TextEditingController _searchController = TextEditingController();
  final EventController eventController = Get.find();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      eventController.setSearchTerm(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: w * .8,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.dateContainerColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: .5,
          color: AppColors.shadowColor.withOpacity(.5),
        ),
      ),
      child: TextFormField(
        controller: _searchController,
        onTap: () {
          setState(() {
            isSearch = true;
          });
        },
        onTapOutside: (val) {
          setState(() {
            isSearch = false;
          });
        },
        cursorHeight: 17,
        cursorColor: AppColors.iconColor,
        style: const TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.iconColor,
          height: .75,
        ),
        decoration: const InputDecoration(
          hintText: 'Search the event',
          hintStyle: TextStyle(
            color: AppColors.shadowColor,
          ),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.iconColor,
          ),
        ),
      ),
    );
  }
}
