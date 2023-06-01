import 'package:flutter/material.dart';

class CardClass {
  final String cardtitle;
  final ImageProvider<Object> backimage;
  final String contentdetail;
  CardClass(this.cardtitle, this.backimage, this.contentdetail);
}

class CardNumberClass {
  final String cardtitle;
  final String phonenumber;
  CardNumberClass(this.cardtitle, this.phonenumber);
}

class CardDataClass {
  final String sourceName;
  final String sourceSubName;
  final String image;
  final String sourceUrl;
  final bool isHaveUri;
  CardDataClass(this.sourceName, this.image, this.sourceUrl, this.sourceSubName,
      this.isHaveUri);
}

class CardDataHealthClass {
  final String alName;
  final String alSymptom;
  CardDataHealthClass(this.alName, this.alSymptom);
}