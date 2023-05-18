import 'package:flutter/material.dart';
import 'package:pos_mobile/pages/queue/components/tab/current_queue.dart';
import 'package:pos_mobile/pages/queue/components/tab/queue_all.dart';
import 'package:pos_mobile/pages/queue/components/tab/queue_card.dart';
import 'package:pos_mobile/pages/queue/components/tab/table_available.dart';
import 'package:pos_mobile/widgets/go_back.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const GoBack(),
          bottom: TabBar(
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black87,
            indicatorColor: Colors.black38,
            tabs: const <Tab>[
              Tab(text: 'คิวที่เรียกล่าสุด'),
              Tab(text: 'บัตรคิว'),
              Tab(text: 'คิวทั้งหมด'),
              Tab(text: 'โต๊ะว่าง'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: const [
            CurrentQueue(),
            QueueCard(),
            QueueAll(),
            TableAvailable(),
          ],
        ),
      ),
    );
  }
}
