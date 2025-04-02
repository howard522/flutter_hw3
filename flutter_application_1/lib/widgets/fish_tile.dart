import 'package:flutter/material.dart';
import '../models/fish.dart';
import '../pages/fish_detail_page.dart';

class FishTile extends StatelessWidget {
  final Fish fish;

  const FishTile({Key? key, required this.fish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 點擊後切換到詳細頁面
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FishDetailPage(fish: fish),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            fish.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(fish.name),
          subtitle: Text(fish.description),
        ),
      ),
    );
  }
}
