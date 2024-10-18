class TeamScoresModel {
  String day;
  int teamE20;
  int teamE21;
  int teamE22;
  int teamE23;

  TeamScoresModel(
      {required this.day,
      required this.teamE20,
      required this.teamE21,
      required this.teamE22,
      required this.teamE23});
}

//sample data
List<TeamScoresModel> teamScores = [
  TeamScoresModel(day: "1", teamE20: 10, teamE21: 20, teamE22: 30, teamE23: 25),
  TeamScoresModel(day: "2", teamE20: 15, teamE21: 25, teamE22: 28, teamE23: 20),
  TeamScoresModel(day: "3", teamE20: 18, teamE21: 22, teamE22: 33, teamE23: 19),
  TeamScoresModel(day: "4", teamE20: 13, teamE21: 20, teamE22: 35, teamE23: 17),
  TeamScoresModel(day: "5", teamE20: 11, teamE21: 12, teamE22: 37, teamE23: 20),
  TeamScoresModel(day: "6", teamE20: 17, teamE21: 18, teamE22: 34, teamE23: 22),
  TeamScoresModel(day: "7", teamE20: 14, teamE21: 24, teamE22: 31, teamE23: 21),
];
