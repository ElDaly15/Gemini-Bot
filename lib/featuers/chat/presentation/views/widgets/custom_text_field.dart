import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.hintTitle,
      required this.obscure,
      required this.onSubmit,
      required this.isPassword,
      required this.textEditingController,
      required this.focusNode,
      required this.onFieldSubmitted});
  final String hintTitle;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String)? onFieldSubmitted;
  bool obscure;

  final Function(String)? onSubmit;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool checkPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: TextSelectionThemeData(
        cursorColor: const Color.fromARGB(255, 46, 4, 48), // Cursor color
        selectionColor: const Color.fromARGB(255, 46, 4, 48).withOpacity(0.54),
        // Selection highlight color
        selectionHandleColor:
            const Color.fromARGB(255, 46, 4, 48), // Handle color
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field Is Required';
          }
          if (value.length < 10) {
            return 'Post Must Be At Least 10 Characters';
          }
          if (value.length > 220) {
            return 'Post Must Be At Most 220 Characters';
          }
          return null;
        },
        onChanged: widget.onSubmit,
        onFieldSubmitted: widget.onFieldSubmitted,

        minLines: 1, // Minimum number of lines
        maxLines: null, // Allows the field to grow dynamically
        style: Style.font18Medium(context),
        decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        checkPassword = !checkPassword;
                        widget.obscure = !checkPassword;
                      });
                    },
                    icon: checkPassword
                        ? const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Color.fromARGB(255, 0, 13, 95),
                          )
                        : const Icon(
                            Icons.remove_red_eye,
                            color: Color.fromARGB(255, 46, 4, 48),
                          ),
                  )
                : null,
            hintText: widget.hintTitle,
            hintStyle: Style.font18Medium(context)
                .copyWith(color: const Color(0xff626262)),
            fillColor: const Color(0xffF1F4FF),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 46, 4, 48), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 46, 4, 48), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
            errorStyle: Style.font14Bold(context).copyWith(color: Colors.red)),
        cursorColor: const Color.fromARGB(255, 61, 7, 63),
        obscureText: widget.obscure,
      ),
    );
  }
}
