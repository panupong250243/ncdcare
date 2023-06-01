import 'package:ncdcare/Views/Main/DataClass/symbolclass.dart';

class QuestionClass {
  final int questionId;
  final String questionTitle;
  final int disease_id;
  final int symbol_id;
  QuestionClass(
      this.questionId, this.questionTitle, this.disease_id, this.symbol_id);
}

class AnswerClass {
  final int answer_id;
  final String answer_title;
  final int answer_score;
  final int question_id;

  AnswerClass(
      this.answer_id, this.answer_title, this.answer_score, this.question_id);
}

class ResultClass {
  final int diseaseId;
  int score;

  ResultClass(this.diseaseId, this.score);
}

class SymbolGetFunction {
  final bool isBMI;
  final bool isAge;
  final bool isFootImage;

  SymbolGetFunction(this.isBMI, this.isAge, this.isFootImage);
}

class ResultSaver {
  final List<SymbolInfo> symptomList;
  final AppearanceClass appearance;
  final int? age;
  final List<ResultClass> result;
  ResultSaver(this.symptomList, this.appearance, this.age, this.result);
}

class AppearanceClass {
  final double? height;
  final double? weight;

  AppearanceClass(this.height, this.weight);
}
