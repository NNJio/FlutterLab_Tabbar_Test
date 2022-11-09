import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({super.key});
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Test Tabbar'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true, //Del space between label
                  labelPadding: const EdgeInsets.only(
                      right: 10), // set space between label

                  tabs: const [
                    Tab(text: 'home'),
                    Tab(text: 'news'),
                    Tab(text: 'dashboard'),
                  ],
                ),
              ),
            ),
            Container(
              width: 600,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        Text('1'),
                        Text('2'),
                        Text('3'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
