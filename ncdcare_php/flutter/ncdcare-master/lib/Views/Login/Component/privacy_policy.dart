import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("นโยบายความเป็นส่วนตัว"),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: height,
        width: width,
        child: ListView(children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "นโยบายคุ้มครองข้อมูลส่วนบุคคล",
            style: TextStyle(
                color: mainColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "ปรับปรุงครั้งล่าสุด: สิงหาคม 2565",
            style: TextStyle(color: mainColor),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "ยินดีต้อนรับคุณสู่แพลตฟอร์ม NCDs CARE แพลตฟอร์มนี้ให้บริการและความคุมโดย กรมควบคุมโรค (Department of Disease Control) ต่อไปในนโยบายนี้จะเรียกว่า “NCDs CARE” หรือ “เรา”",
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เรามีความมุ่งมั่นที่จะปกป้องความเป็นส่วนตัวของคุณ โดยนโยบายนี้จะอธิบายแนวทางปฏิบัติของเราเกี่ยวกับข้อมูลส่วนบุคคลที่เราเก็บรวบรวมจากคุณ หรือ ข้อมูลที่คุณมอบให้ ทั้งนี้ หากคุณไม่เห็นด้วยกับนโยบาย กรุณางดการใช้แพลตฟอร์ม",
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "หากคุณมีข้อสงสัยประการใดเกี่ยวกับวิธีที่เราใช้ข้อมูลส่วนบุคคลของคุณ โปรดติดต่อ contact@ncds-care.com",
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เนื้อหาโดยสรุป",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "ข้อมูลที่เราเก็บรวบรวมเกี่ยวกับคุณ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "ตามที่กำหนดไว้ในข้อ 1 ด้านล่างนี้ เราจะเก็บรวบรวมและประมวลผลข้อมูลที่คุณให้มา (รวมถึงที่อยู่อีเมล) เมื่อคุณสร้างบัญชีและอัปโหลดเนื้อหาบนแพลตฟอร์ม โดยเราเก็บรวบรวมข้อมูลเกี่ยวกับการเข้าถึงและการใช้แพลตฟอร์มของคุณโดยอัตโนมัตซึ่งรวมถึงข้อมูลทางเทคนิคและพฤติกรรมเกี่ยวกับการเข้าถึงและการใช้งานแพลตฟอร์มของคุณ และข้อมูลตำแหน่งสถานที่ เราจะเก็บรวบรวมเนื้อหาที่ผู้ใช้สร้างขึ้น ณ เวลาที่ทำการสร้าง การนำเข้า หรือการอัปโหลด ไม่ว่าคุณเลือกที่จะบันทึกหรืออัปโหลดเนื้อหาที่ผู้ใช้สร้างขึ้นนั้นหรือไม่ นอกจากนี้เรายังเก็บรวบรวมข้อมูลเกี่ยวกับคุณโดยอัตโนมัติหากคุณดาวน์โหลดแอปและ/หรือโต้ตอบกับแพลตฟอร์มโดยไม่ได้สร้างบัญชี",
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เราใช้ข้อมูลเกี่ยวกับคุณอย่างไร",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เราใช้ข้อมูลของคุณเพื่อให้บริการแพลตฟอร์มแก่คุณ และเพื่อปรับปรุงและจัดการแพลตฟอร์ม โดยเราจะใช้ข้อมูลของคุณเพื่อการวิเคราะห์โรคอีกทั้งเพื่อปรับปรุงและพัฒนาแพลตฟอร์มและกำกับดูแลความปลอดภัยของคุณ และในกรณีที่เหมาะสม เราจะใช้ข้อมูลส่วนบุคคลของคุณเพื่อให้บริการโฆษณาที่ตรงกับกลุ่มเป้าหมายและโปรโมทแพลตฟอร์ม",
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เราเปิดเผยข้อมูลของคุณกับใคร",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เราเปิดเผยข้อมูลของคุณกับผู้ให้บริการซึ่งเป็นบุคคลภายนอกที่ช่วยเราให้บริการแพลตฟอร์ม เช่น ผู้ให้บริการพื้นที่เก็บข้อมูลบนคลาวด์ นอกจากนี้เรายังเปิดเผยข้อมูลของคุณกับพันธมิตรทางธุรกิจ บริษัทอื่น ๆ ในกลุ่มบริษัทเดียวกันกับ กรมควบคุมโรค ผู้ให้บริการกลั่นกรองเนื้อหา ผู้ให้บริการด้านการวัดผล ผู้โฆษณาและผู้ให้บริการด้านการวิเคราะห์ ในกรณีที่กฎหมายกำหนด เราจะเปิดเผยข้อมูลของคุณกับหน่วยงานที่มีหน้าที่บังคับใช้กฎหมายหรือหน่วยงานกำกับดูแล รวมถึงบุคคลภายนอกตามคำสั่งศาลที่มีผลผูกพันตามกฎหมาย",
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เราเก็บข้อมูลของคุณไว้นานแค่ไหน",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "เราจะเก็บรักษาข้อมูลของคุณไว้ตราบเท่าที่จำเป็นเพื่อให้บริการแก่คุณหรือตามที่กฎหมายกำหนด ในกรณีที่เราไม่ต้องการข้อมูลของคุณเพื่อให้บริการแก่คุณเราจะเก็บรักษาข้อมูลไว้ตราบที่เรามีวัตถุประสงค์ทางธุรกิจที่ชอบด้วยกฎหมายในการเก็บข้อมูลดังกล่าว หรือในกรณีที่เราอยู่ภายใต้ภาระหน้าที่ทางกฎหมายในการเก็บรักษาข้อมูล นอกจากนี้เราจะเก็บรักษาข้อมูลของคุณไว้หากเราเชื่อว่าจำเป็นหรืออาจจะจำเป็นสำหรับทำการฟ้องร้อง ใช้สิทธิเรียกร้องทางกฎหมาย หรือต่อสู้ข้อเรียกร้องทางกฎหมาย",
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
