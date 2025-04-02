import 'package:flutter/material.dart';
import 'fish_category_page.dart';
import '../models/fish.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 分為淺水魚和深海魚
      child: Scaffold(
        appBar: AppBar(
          title: Text('魚類電子書'),
          bottom: TabBar(
            tabs: [
              Tab(text: '淺水魚'),
              Tab(text: '深海魚'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FishCategoryPage(
              categoryName: '淺水魚',
              fishList: shallowFishList,
            ),
            FishCategoryPage(
              categoryName: '深海魚',
              fishList: deepSeaFishList,
            ),
          ],
        ),
      ),
    );
  }
}
