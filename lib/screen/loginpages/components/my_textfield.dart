import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
   String? initialValue;
  final bool obscureText;
  final Function validator;
  bool? enabled;
  ValueChanged<String>? onChanged;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
    this.enabled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (val) => validator(val),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabled: enabled ?? true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          // fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

class MyPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  late bool obscureText;
  ValueChanged<String>? onChanged;
  final Function validator;

  MyPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.onChanged,
    required this.validator,
  });

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => widget.validator(val),
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          // suffixIcon: const Icon(Icons.visibility_off),
          suffixIcon: IconButton(
            icon: Icon(
                widget.obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          // fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

// class MyPasswordTextField extends StatelessWidget {
//   final TextEditingController  controller;
//   final String hintText;
//   final bool obscureText;
//   const MyPasswordTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.obscureText,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: (val) => val!.isEmpty ? 'Veuillez remplir ce champ svp' : null,
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//           // suffixIcon: const Icon(Icons.visibility_off),
//           suffixIcon: IconButton(
//             icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
//             onPressed: () {
//               obscureText = !obscureText;
//             },
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade400),
//           ),
//           fillColor: Colors.grey.shade200,
//           filled: true,
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.grey[500])),
//     );
//   }
// }
