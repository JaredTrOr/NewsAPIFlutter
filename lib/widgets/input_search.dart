import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController inputController;
  final String? initialValue;
  const InputSearch({super.key, required this.inputController, this.initialValue});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size; 

    return SizedBox(
      width: screenSize.width * 0.8,
      child: TextFormField(
        initialValue: initialValue,
        controller: inputController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        
        validator: (value) {
          if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
            return 'Write correct data';
          }
          else{
            return null;
          }
        },
      ),
    );
  }
}