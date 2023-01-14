import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task/core/constants/color_constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: Column(
        children: [
          TextFormField(
            key: key,
            onChanged: onChanged,
            cursorColor: ColorConstant.instance.dark,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: context.dynamicWidth(0.03), vertical: 0),
              hintText: "Search here...",
              enabledBorder: _buildOutlineInputBorder(context),
              focusedBorder: _buildOutlineInputBorder(context),
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.normalRadius.y)),
      borderSide: BorderSide(color: ColorConstant.instance.dark2),
    );
  }
}
