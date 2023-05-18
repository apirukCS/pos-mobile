import 'package:flutter/material.dart';
import 'package:pos_mobile/widgets/go_back.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen>
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
          indicatorColor: Colors.green,
          tabs: const <Tab>[
            Tab(text: 'ขาย'),
            Tab(text: 'โต๊ะ'),
            Tab(text: 'บิลทั้งหมด'),
            Tab(text: 'ลิ้นชักเงินสด'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('This is sale page'),
          ),
        ],
      ),
    ));
  }
}
