import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.readOnly = false,
    this.onTap,
    this.isDropdownField = false,
    this.textController,
    this.suffixIcon = '',
    this.prefixIcon = '',
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.labelText,
    this.width,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.isPasswordField = false,
    this.errorText = '',
    this.onSaved,
    this.onChanged,
    this.isReferralCode = false,
  });

  final bool isReferralCode;
  final void Function()? onTap;
  final bool isDropdownField, readOnly;
  final onSaved;
  final void Function(String)? onChanged;
  final width;
  final errorText;
  final isPasswordField;
  final textCapitalization;
  final textController;
  final textInputAction;
  final labelText;
  final keyboardType;
  final hintText;
  final String suffixIcon;
  final String prefixIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = FocusNode();
  DateTime selectedDate = DateTime.now();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? Get.width,
      child: TextFormField(
        readOnly: widget.readOnly,
        focusNode: _focusNode,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        enableInteractiveSelection: true,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          paste: true,
          cut: true,
          selectAll: true,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        obscuringCharacter: '●',
        obscureText: widget.isPasswordField ? _obscureText : false,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.black.withOpacity(.8),
            fontSize: 14,
            fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0, height: 0),
          errorText: widget.errorText,
          prefixIcon: widget.prefixIcon==''?null:
            SizedBox(
              height: 17,
              width: 17,
              child: SvgPicture.asset(
                widget.prefixIcon,
                color: Colors.black,
              ),
            ),
          suffixIcon: widget.suffixIcon == ''
              ? null
              : GestureDetector(
                  onTap: () => _toggle(),
                  child: SvgPicture.asset(
                    widget.suffixIcon,
                    height: 14,
                    width: 14,
                    color: Colors.black26.withOpacity(.65),
                  ),
                ),
          contentPadding: const EdgeInsets.only(left: 18),
          hintText: widget.hintText,
          labelText: widget.labelText,
          floatingLabelBehavior: widget.isReferralCode
              ? FloatingLabelBehavior.never
              : FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
              fontSize: _focusNode.hasFocus ? 14 : 12,
              color: _focusNode.hasFocus
                  ? widget.errorText == ''
                      ? const Color(0xffFE7A01)
                      : Colors.red
                  : Colors.black26,
              fontWeight:
                  _focusNode.hasFocus ? FontWeight.w600 : FontWeight.w600),
          hintStyle: TextStyle(
              fontSize: 12,
              color: Colors.black26.withOpacity(.45),
              fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xffDADEE3),
              width: 4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.black26.withOpacity(.3),
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: widget.errorText == ''
                    ? Colors.black26.withOpacity(.3)
                    : Colors.red,
                width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: widget.errorText == ''
                    ? const Color(0xffFE7A01)
                    : Colors.red,
                width: 1),
          ),
          suffix: widget.isPasswordField
              ? Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.5)),
                  width: 48,
                  height: 28,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: const Color(0xffFE7A01).withOpacity(.1),
                    splashRadius: 16,
                    onPressed: _toggle,
                    icon: Center(
                      child: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 14,
                        color: Colors.grey.withOpacity(.8),
                      ),
                    ),
                  ),
                )
              : null,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
