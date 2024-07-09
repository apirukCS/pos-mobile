import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pos_mobile/api/list_item_bar_manage_table.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/enums/table_type.dart';
import 'package:pos_mobile/models/table_position.dart';
import 'package:pos_mobile/models/table_type_model.dart';
import 'package:pos_mobile/models/table_size.dart';
import 'package:pos_mobile/pages/manage_table/components/card_item_bar_table.dart';
import 'package:pos_mobile/pages/manage_table/components/card_table.dart';
import 'package:pos_mobile/utils/sizes.dart';
import 'package:pos_mobile/widgets/dialog/alert.dart';
import 'package:pos_mobile/widgets/full_button.dart';
import 'package:pos_mobile/widgets/go_back.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageTableScreen extends StatefulWidget {
  const ManageTableScreen({Key? key}) : super(key: key);

  @override
  State<ManageTableScreen> createState() => _ManageTableScreenState();
}

class _ManageTableScreenState extends State<ManageTableScreen> {
  late TABLE_TYPE tableType;

  //ความกว้างของรายการโต๊ะที่ต้องการเลือกไปวาง
  late double listItemBarWidth;

  //ความกว้างยาวของหน้าจอในการจัด layout โต๊ะ
  late double screenWidth;
  late double screenHeight;
  late double headerHeight;
  String tableName = '';

  //ไอดีของโต๊ะที่เลือกล่าสุด
  late int idTableInItemBar;

  //รายการโต๊ะที่ต้องการเลือกไปวาง
  List<TableTypeModel> listItemBar = [];

  //โต๊ะที่ถูกเพิ่มไปที่หน้าจอ
  List<TablePositionModel> tableSelected = [];

  //คีย์ของแต่ละโต๊ะ ใช้เพื่อเช็คเมื่อวางโต๊ะซ้อนทับกัน
  List<GlobalKey> gbkTable = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenWidth = displayWidth(context) * 0.85;
      listItemBarWidth = displayWidth(context) * 0.15;
      screenHeight = displayHeight(context) * 0.9;
      headerHeight = displayHeight(context) * 0.1;
      getListItemBar();
      getPositionTables();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: headerHeight,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(left: kPadding, right: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GoBack(),
                  const Text('Zone 2', style: titleAppBar),
                  IconButton(
                    onPressed: _clearTable,
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: listItemBarWidth,
                height: screenHeight,
                color: Colors.grey.shade300,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      listItemBar.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: InkWell(
                          onTap: () => _selectedTable(
                            listItemBar[index].tableTypeId,
                            listItemBar[index],
                          ),
                          child: CardItemBarTable(
                            tableTypeId: listItemBar[index].tableTypeId,
                            barHeight: screenHeight,
                            barWidth: listItemBarWidth - (kPadding * 2),
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: Stack(
                    children: List.generate(
                      tableSelected.length,
                      (index) => Positioned(
                        left: tableSelected[index].dx,
                        top: tableSelected[index].dy,
                        child: Draggable(
                          feedback: CardTable(
                            gbkTable: gbkTable[index],
                            tablePosition: tableSelected[index],
                            screenHeight: screenHeight,
                          ),
                          childWhenDragging: Container(),
                          onDragEnd: (pst) => _calculateOffset(
                              gbkTable[index],
                              pst.offset,
                              index,
                              tableSelected[index].tableTypeModel),
                          child: GestureDetector(
                            onTap: () => _onTapCardTable(index),
                            child: CardTable(
                              gbkTable: gbkTable[index],
                              tablePosition: tableSelected[index],
                              screenHeight: screenHeight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: tableSelected.isNotEmpty
          ? FullButton(
              text: 'บันทึก',
              btnWidth: 120,
              btnHeight: 50,
              paddingLR: kPadding,
              icon: Icons.save,
              onPress: _onTapSaveLayOutTable,
            )
          : const SizedBox(),
    );
  }

  //เมื่อย้าย table เสร็จ(drag end)
  void _calculateOffset(
      GlobalKey gbk, Offset pst, int index, TableTypeModel tbTypeMoved) {
    if (!_tableOverlapping(gbkTable)) {
      double dx = pst.dx;
      double dy = pst.dy;

      idTableInItemBar = tbTypeMoved.tableTypeId;
      TABLE_TYPE tbType = getFromId(idTableInItemBar);
      TableSizeModel tableSizeModel = getSize(
        context,
        tbType,
        screenWidth,
        screenHeight,
      );

      double tableHeight = tableSizeModel.height;
      double tableWidth = tableSizeModel.width;

      //วางเกินขอบเขตด้านบน
      if (dy < headerHeight) {
        dy = headerHeight;
      }
      //วางเกินขอบเขตด้านล่าง
      if (dy > (screenHeight - tableHeight) + headerHeight) {
        dy = (screenHeight - tableHeight) + headerHeight;
      }
      //วางเกินขอบเขตด้านซ้าย
      if (dx < listItemBarWidth) {
        dx = listItemBarWidth;
      }
      //วางเกินขอบเขตด้านขวา
      if (dx > (screenWidth - tableWidth) + listItemBarWidth) {
        dx = (screenWidth - tableWidth + listItemBarWidth);
      }
      tableSelected[index] = TablePositionModel(
        dx: dx - listItemBarWidth,
        dy: dy - headerHeight,
        tableTypeModel: tbTypeMoved,
        tableSizeModel: tableSizeModel,
      );
      tableType = tbType;
      setState(() {});
    }
  }

  //เมื่อเลือก table จาก itemBar
  void _selectedTable(int tableTypeId, TableTypeModel tbTypeModel) {
    idTableInItemBar = tbTypeModel.tableTypeId;
    TABLE_TYPE tbType = getFromId(idTableInItemBar);
    TableSizeModel tableSize =
        getSize(context, tbType, screenWidth, screenHeight);
    TablePositionModel model = TablePositionModel(
      dx: 0,
      dy: 0,
      tableTypeModel: tbTypeModel,
      tableSizeModel: tableSize,
    );
    tableSelected.add(model);
    gbkTable.add(GlobalKey());
    tableType = tbType;
    setState(() {});
  }

  void getListItemBar() async {
    listItemBar = await ListItemBarManageTable.getAllItemBar();
  }

  void _clearTable() {
    tableSelected.clear();
    gbkTable.clear();
    setState(() {});
  }

  //เช็คว่า widget ซ้อนทับกันหรือไม่
  bool _tableOverlapping(List<GlobalKey> gbk) {
    for (int i = 0; i < gbk.length - 1; i++) {
      final RenderBox rnb =
          gbk[i].currentContext?.findRenderObject() as RenderBox;
      final position1 = rnb.localToGlobal(Offset.zero);
      final size1 = rnb.size;
      final rect1 = Rect.fromPoints(
        position1,
        position1.translate(size1.width, size1.height),
      );

      for (int j = i + 1; j < gbk.length; j++) {
        final RenderBox rnb2 =
            gbk[j].currentContext?.findRenderObject() as RenderBox;
        final position2 = rnb2.localToGlobal(Offset.zero);
        final size2 = rnb2.size;
        final rect2 = Rect.fromPoints(
          position2,
          position2.translate(size2.width, size2.height),
        );
        if (rect1.overlaps(rect2)) {
          return true; // Overlapping detected
        }
      }
    }
    return false; // No overlapping detected
  }

  //บันทึก layout โต๊ะ
  void _onTapSaveLayOutTable() {
    Alert.normal(
      context: context,
      text: 'ต้องการบันทึกใช่หรือไม่',
      onConfirm: () async {
        List<TablePositionModel> tbPositions = [];
        for (int i = 0; i < tableSelected.length; i++) {
          double pstDx = (tableSelected[i].dx / screenWidth) * 100;
          double pstDy = (tableSelected[i].dy / screenHeight) * 100;
          double pstWidth =
              (tableSelected[i].tableSizeModel.width / screenWidth) * 100;
          double pstHeight =
              (tableSelected[i].tableSizeModel.height / screenHeight) * 100;
          TableSizeModel tbSize =
              TableSizeModel(width: pstWidth, height: pstHeight);
          TablePositionModel tbPst = TablePositionModel(
            dx: pstDx,
            dy: pstDy,
            tableSizeModel: tbSize,
            tableTypeModel: tableSelected[i].tableTypeModel,
          );
          tbPositions.add(tbPst);
        }

        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> pstTables =
            tbPositions.map((data) => json.encode(data.toJson())).toList();
        await prefs.setStringList('@pstTables', pstTables);
      },
    );
  }

  //ดึงข้อมูลตำแหน่งโต๊ะที่เคยบันทึก
  Future<void> getPositionTables() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList('@pstTables');
    if (jsonList != null) {
      //list เก็บค่าชั่วคราว
      List<TablePositionModel> tmp = tablePositionFromJson(jsonList.toString());
      List<TablePositionModel> tbPositions = [];
      for (int i = 0; i < tmp.length; i++) {
        double dx = (tmp[i].dx * screenWidth) / 100;
        double dy = (tmp[i].dy * screenHeight) / 100;
        TablePositionModel tbPosition = TablePositionModel(
          dx: dx,
          dy: dy,
          tableTypeModel: tmp[i].tableTypeModel,
          tableSizeModel: getSizeTable(tmp[i].tableTypeModel.tableTypeId),
        );
        gbkTable.add(GlobalKey());
        tbPositions.add(tbPosition);
      }
      tableSelected = tbPositions;
    }
  }

  TableSizeModel getSizeTable(int tableTypeId) {
    TABLE_TYPE tbType = getFromId(tableTypeId);
    return getSize(context, tbType, screenWidth, screenHeight);
  }

  void _onTapCardTable(int index) {
    Alert.normal(
      context: context,
      text: 'ต้องการนำโต๊ะออกใช่หรือไม่',
      onConfirm: () {
        tableSelected.removeAt(index);
        gbkTable.removeAt(index);
        setState(() {});
      },
    );
  }
}
