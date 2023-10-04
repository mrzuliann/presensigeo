import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputText extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;
  final Function()? onTap;
  final Function(dynamic)? onChanged;
  final bool readOnly;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool filled;
  final double marginTop;
  final Color? filledColor;
  final TextStyle? titleStyle;
  final Function(dynamic)? onSaved;
  final String? Function(String?)? validator;
  final bool isValidator;
  final bool isBorder;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final TextStyle? style;
  final double radius;

  const CustomInputText({
    Key? key,
    this.title,
    this.controller,
    this.hintText,
    this.inputType = TextInputType.text,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.suffix,
    this.suffixIcon,
    this.marginTop = 0,
    this.filled = false,
    this.filledColor,
    this.titleStyle,
    this.onSaved,
    this.validator,
    this.isValidator = true,
    this.isBorder = true,
    this.inputFormatters,
    this.minLines,
    this.maxLines,
    this.style,
    this.radius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: marginTop,
        ),
        Visibility(
          visible: title == null ? false : true,
          child: Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChanged,
            onSaved: onSaved,
            controller: controller,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            minLines: minLines,
            maxLines: maxLines,
            style: style,
            decoration: InputDecoration(
              filled: filled,
              fillColor: filledColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              focusedBorder: readOnly
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))
                  : null,
              enabledBorder: readOnly
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))
                  : null,
              border: OutlineInputBorder(
                borderSide: isBorder ? const BorderSide() : BorderSide.none,
                borderRadius: BorderRadius.circular(radius),
              ),
              hintText: hintText,
              hintStyle: style,
              suffix: suffix,
              suffixIcon: suffixIcon,
            ),
            validator: isValidator
                ? (validator ??
                    (value) {
                      return value!.isEmpty ? 'Please enter $title' : null;
                    })
                : null,
          ),
        ),
      ],
    );
  }
}
