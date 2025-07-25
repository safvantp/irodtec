import 'package:flutter/material.dart';

class PropertyFeature extends StatelessWidget {
  final IconData icon;
  final String value;
  final String $data;

  PropertyFeature(this.icon, this.value, this.$data);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 22, color: Colors.black),
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Text(
            $data,
            style: TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
