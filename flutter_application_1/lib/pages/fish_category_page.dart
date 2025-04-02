import 'package:flutter/material.dart';
import '../models/fish.dart';
import 'fish_detail_page.dart';
import '../widgets/fish_tile.dart';

class FishCategoryPage extends StatelessWidget {
  final String categoryName;
  final List<Fish> fishList;

  const FishCategoryPage({
    Key? key,
    required this.categoryName,
    required this.fishList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 列表與格子視圖
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(text: '列表'),
              Tab(text: '格子'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // 列表頁面：使用 ListView.separated
                ListView.separated(
                  itemCount: fishList.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final fish = fishList[index];
                    return FishTile(fish: fish);
                  },
                ),
                // 格子頁面：使用 GridView.builder
                GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: fishList.length,
                  itemBuilder: (context, index) {
                    final fish = fishList[index];
                    return GestureDetector(
                      onTap: () {
                        // 點擊後進入詳細頁面
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FishDetailPage(fish: fish),
                          ),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              fish.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(
                              fish.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
