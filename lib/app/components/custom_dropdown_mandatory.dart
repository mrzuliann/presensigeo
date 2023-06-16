import 'package:flutter/material.dart';

class CustomDropdownMandatory extends StatelessWidget {
  final String? title;
  final String? dropdownValue;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final String? hint;
  const CustomDropdownMandatory({
    Key? key,
    this.title,
    this.dropdownValue,
    required this.items,
    required this.onChanged,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox(),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<dynamic>(
              isExpanded: true,
              hint: Text(hint ?? ''),
              value: dropdownValue != "" ? dropdownValue : null,
              items: items,
              onChanged: onChanged,
              validator: (value) =>
                  value == null ? 'Please enter $title' : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
