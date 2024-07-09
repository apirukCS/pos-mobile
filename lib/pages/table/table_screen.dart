import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/table/components/card_item_table.dart';
import 'package:pos_mobile/widgets/go_back.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<bool> isSelectedZone = [];

  @override
  void initState() {
    //Todo change to get data from api
    //isSelectedZone = List.generate(api.length, (index) => index==0 ?true : false);

    isSelectedZone = [true, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('โต๊ะ'),
          leading: const GoBack(),
        ),
        body: SizedBox(
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(kHalfPadding * 3),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.grey.shade200,
                ),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: kHalfPadding),
                    itemCount: isSelectedZone.length,
                    itemBuilder: (context, index) {
                      return itemHeader(
                        text: 'Zone $index',
                        isSelected: isSelectedZone[index],
                        onTap: () {
                          _onTapCardTable(index);
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: kHalfPadding),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 7,
                childAspectRatio: (1 / 1),
                padding: const EdgeInsets.all(kHalfPadding),
                children: List.generate(
                  10,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(kHalfPadding),
                      child: CardItemTable(
                        numberTable: '$index',
                        isAvailable: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemHeader({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          kHalfPadding,
          kHalfPadding * 3,
          kHalfPadding,
          kHalfPadding * 3,
        ),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: isSelected ? Theme.of(context).primaryColor : null,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(kHalfPadding),
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapCardTable(int index) {
    setState(() {
      isSelectedZone = List.filled(isSelectedZone.length, false);
      isSelectedZone[index] = true;
    });
  }
}
