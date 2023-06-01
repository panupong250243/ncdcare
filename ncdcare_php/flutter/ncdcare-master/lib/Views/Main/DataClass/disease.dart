class DiseaseSymptom {
  final String symptomId;
  final String symptomName;
  final String symptomPart;

  DiseaseSymptom(this.symptomId, this.symptomName, this.symptomPart);
}

class WeightHeight {
  final double? Height;
  final double? Weight;

  WeightHeight(this.Height, this.Weight);
}

class SymptomDetail {
  final String symptomTitle;
  final String symptomSubTitle;

  SymptomDetail(this.symptomTitle, this.symptomSubTitle);
}

class AnalyzeResult {
  final List<DiseaseSymptom> symptomList;
  final WeightHeight appearance;
  final int age;
  final List<SymptomDetail> detail;
  final List<AnalyzeResultChance> result;
  AnalyzeResult(
      this.symptomList, this.appearance, this.age, this.detail, this.result);
}

class AnalyzeResultChance {
  final String diseaseName;
  final double diseaseChance;
  AnalyzeResultChance(this.diseaseName, this.diseaseChance);
}

class HistoryResult {
  final int id;
  final List<int> symptomList;
  final WeightHeight appearance;
  final int? age;
  final FootImage? image;
  HistoryResult(
      this.id, this.symptomList, this.appearance, this.age, this.image);
}

class FootImage {
  final int id;
  final String name;
  final int status;
  final int result;
  final int diseaseId;
  FootImage(this.id, this.name, this.status, this.result, this.diseaseId);
}

class HistoryResultDetail {
  final int detailId;
  final double detailScore;
  final double detailMaxScore;
  final int diseaseId;
  final String diseaseName;

  HistoryResultDetail(this.detailId, this.detailScore, this.detailMaxScore,
      this.diseaseId, this.diseaseName);
}
