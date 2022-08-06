import 'dart:math';

import 'package:flutter/cupertino.dart';

class ConcentricManager with ChangeNotifier {
  late List<Color> colorsList;
  //原始颜色数组
  late List<Color> originalColorList;
  late DateTime datetime; // 时间
  ConcentricManager(this.colorsList){
    //对colorList数组进行深拷贝
    originalColorList =  List<Color>.generate(
        colorsList.length,//要传入的长度，不能大于_categoryListModel.goods的长度，可根据实际需要设置
            (int index){//创建新的QualitySamplingGoodsModel，默认系统会主动帮我们创建
          return colorsList[index];
        },growable: true);
    datetime = DateTime.now();
  }

  void tick(DateTime now) {
    randomColorList();
    notifyListeners();
  }

  void reverseColorList() {
    //数组反转
   colorsList = colorsList.reversed.toList();
  }

  void randomColorList(){
    int count = 0;
    int size = colorsList.length;
    Random random = Random();
    List<Color> tempList = [];
    //随机颜色变化
    colorsList.forEach((element) {
      int index = random.nextInt(size-1);
      debugPrint("index:${index}");
      tempList.add(originalColorList[index]);
      count++;
    });
    colorsList = tempList;
  }
}
