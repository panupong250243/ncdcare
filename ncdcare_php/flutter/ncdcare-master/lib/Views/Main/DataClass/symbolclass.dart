import 'package:flutter/material.dart';

class BodyPartInfo {
  final int bodyPartId;
  final String bodyPartName;
  final IconData bodyIcon;
  BodyPartInfo(this.bodyPartId, this.bodyPartName, this.bodyIcon);
}

class SymbolInfo {
  final int symbolId;
  final String symbolName;
  final String symbolDec;
  final int bodyPartId;
  final int diseaseId;
  bool isMost = false;
  SymbolInfo(this.symbolId, this.symbolName, this.symbolDec, this.bodyPartId,
      this.isMost, this.diseaseId);
}
