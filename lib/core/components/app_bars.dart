import 'package:flutter/material.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.android, color: Colors.white),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Assistant',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Active Now',
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
