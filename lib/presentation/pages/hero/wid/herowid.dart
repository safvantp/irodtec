import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String title;
  
  NavItem(this.title);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white, 
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Search dropdown widget
class SearchDropdown extends StatelessWidget {
  final String hint;
  
  SearchDropdown(this.hint);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint, style: TextStyle(color: Colors.grey.shade600)),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
        ],
      ),
    );
  }
}