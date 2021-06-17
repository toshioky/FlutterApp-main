class EquipmentConst {
  final String picture;
  final String name;
  final String sub;
  final int stock;
  final String biko;

  const EquipmentConst( {required this.picture, required this.name, required this.sub, required this.stock, required this.biko});
}

class EquipmentListData {
  static const listData = <EquipmentConst>[
    EquipmentConst(picture: 'assets/images/ccccc.png', name: 'コーヒー', stock: 1, sub: '説明欄リスト1', biko: '備考'),
    EquipmentConst(picture: 'assets/images/beer.jpg', name: 'ビール', stock: 2, sub: '説明欄リスト2', biko: '備考と備考'),
    EquipmentConst(picture: 'assets/images/tissue.jpg', name: '生活用品', stock: 3, sub: '説明欄リスト3', biko: 'これは備考びこう'),
    EquipmentConst(picture: 'assets/images/glass.jpg', name: '何々用品', stock: 4, sub: '説明欄リスト4', biko: '備考備考備考備考備考備考備考備考備考備考備考備考備考備考備考備考備考備考備考'),
    EquipmentConst(picture: 'assets/images/beer.jpg', name: '用品5', stock: 5, sub: '説明欄リスト5', biko: 'びこう備考'),
    EquipmentConst(picture: 'assets/images/tissue.jpg', name: '用品6', stock: 6, sub: '説明欄リスト6', biko: 'びこう備考備考'),
    EquipmentConst(picture: 'assets/images/beer.jpg', name: '用品7', stock: 7, sub: '説明欄リスト7', biko: 'びこう備考びこう'),
    EquipmentConst(picture: 'assets/images/glass.jpg', name: '用品8', stock: 8, sub: '説明欄リスト8', biko: 'びこう'),
    EquipmentConst(picture: 'assets/images/beer.jpg', name: '用品9', stock: 9, sub: '説明欄リスト9', biko: '備考備考'),
    EquipmentConst(picture: 'assets/images/ccccc.png', name: '用品10', stock: 13, sub: '説明欄リスト10', biko: '備考備考'),
    EquipmentConst(picture: 'assets/images/tissue.jpg', name: '用品用品11', stock: 31, sub: '説明欄リスト11', biko: '備考備考'),
  ];
}
