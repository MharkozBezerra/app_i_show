import 'package:flutter/material.dart';

class Inputcustomizado extends StatelessWidget {
  
  final String hint;
  final bool obscure;
  final Icon icon;
  const Inputcustomizado({super.key, required this.hint, this.obscure = false, this.icon = const Icon(Icons.person) });




  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: hint,
            
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
            icon: icon,
            border: InputBorder.none),
      ),
    );
  }
}
