import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
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
          height: .75, // Adjust the text's vertical alignment
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
          // Center vertically
        ),
      ),
    );
  }
}
