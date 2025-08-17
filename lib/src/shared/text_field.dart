import '../global_export.dart';

class CLTextField extends StatelessWidget {  
  const CLTextField({
    super.key,
    this.enabled,
    this.onChanged,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.keyboardType
  });

  final bool? enabled;
  final Widget? suffixIcon, prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled, 
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Theme.of(context).textTheme.headlineMedium?.color,
      onChanged: onChanged,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
      ),
    );
  }
}
