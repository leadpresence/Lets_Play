import 'package:flutter/material.dart';
import '../modules/jekawin_club/views/mobile/widgets/components/custom_text_field.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    Key? key,
    this.width,
    this.textController,
    this.validator,
    this.readOnly = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.floatingLabelBehaviour = FloatingLabelBehavior.auto,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSaved,
    this.isPasswordField = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.onTap,
    this.isUnique,
    this.onFieldSubmitted,
    this.focusedBorderColor = const Color(0xffFE7A01),
    this.filled = false,
  }) : super(key: key);

  final double? width;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final bool readOnly;
  final AutovalidateMode autovalidateMode;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  final String? hintText, labelText;
  final Widget? suffixIcon;
  final FloatingLabelBehavior? floatingLabelBehaviour;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final bool? isUnique;
  final Color focusedBorderColor;
  final bool filled;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  bool _obscureText = true;
  var _focusNode = FocusNode();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        height: 34,
        child: Center(
          child: SizedBox(
            width: widget.width ?? screen.width,
            child: Center(
              child: TextFormField(
                controller: widget.textController,
                validator: widget.validator,
                autovalidateMode: widget.autovalidateMode,
                readOnly: widget.readOnly,
                focusNode: _focusNode,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                enableInteractiveSelection: true,
                onTap: widget.onTap,
                onFieldSubmitted: widget.onFieldSubmitted,
                onChanged: widget.onChanged,
                onSaved: widget.onSaved,
                cursorWidth: 2,
                cursorColor: const Color(0xffFE7A01),
                // cursorHeight: 16,
                autofocus: true,
                obscuringCharacter: '●',
                obscureText: widget.isPasswordField ? _obscureText : false,
                keyboardType: widget.keyboardType,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: widget.filled,
                  fillColor: const Color(0XFFEBEBEB),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.isPasswordField
                      ? PasswordSuffixWidget(
                          obscureText: _obscureText,
                          onPressed: _toggle,
                        )
                      : widget.suffixIcon,
                  contentPadding: const EdgeInsets.only(bottom: 13),
                  hintText: widget.hintText,
                  labelText: widget.labelText,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: widget.floatingLabelBehaviour,
                  floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Colors.red //Theme.of(context).errorColor
                          : const Color(0xffFE7A01);
                      return TextStyle(
                        color: color,
                        letterSpacing: 1.3,
                      );
                    },
                  ),
                  labelStyle: TextStyle(
                      fontSize: _focusNode.hasFocus ? 16 : 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                      letterSpacing: -.2),
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -.2
                      // letterSpacing: 1.1,
                      ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
