import 'package:cevapp/ui/constants/app_paths.dart';

class UserRank {
  final String rank;
  final String avatarPath;

  UserRank({required this.rank, required this.avatarPath});
}

class UserRankLevels {
  static const int novice = 0;
  static const int beginner = 5;
  static const int competent = 15;
  static const int proficient = 30;
  static const int expert = 50;
  static const int master = 75;
  static const int unimagined = 100;
}

final Map<String, UserRank> userRanksObject = {
  // novice
  "noviceLION": UserRank(rank: "Novice", avatarPath: AppPaths.noviceLION),
  "noviceOWL": UserRank(rank: "Novice", avatarPath: AppPaths.noviceOWL),
  "noviceDOLPHIN": UserRank(rank: "Novice", avatarPath: AppPaths.noviceDOLPHIN),
  "noviceDRAGON": UserRank(rank: "Novice", avatarPath: AppPaths.noviceDRAGON),
  "noviceBIRD": UserRank(rank: "Novice", avatarPath: AppPaths.noviceBIRD),
  "noviceELEPHANT":
      UserRank(rank: "Novice", avatarPath: AppPaths.noviceELEPHANT),

  // beginner
  "beginnerLION": UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerLION),
  "beginnerOWL": UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerOWL),
  "beginnerDOLPHIN":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerDOLPHIN),
  "beginnerDRAGON":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerDRAGON),
  "beginnerBIRD": UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerBIRD),
  "beginnerELEPHANT":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerELEPHANT),

  // competent
  "competentLION":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentLION),
  "competentOWL":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentOWL),
  "competentDOLPHIN":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentDOLPHIN),
  "competentDRAGON":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentDRAGON),
  "competentBIRD":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentBIRD),
  "competentELEPHANT":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentELEPHANT),

  // proficient

  "proficientLION":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientLION),
  "proficientOWL":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientOWL),
  "proficientDOLPHIN":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientDOLPHIN),
  "proficientDRAGON":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientDRAGON),
  "proficientBIRD":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientBIRD),
  "proficientELEPHANT":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientELEPHANT),

  // expert
  "expertLION": UserRank(rank: "Expert", avatarPath: AppPaths.expertLION),
  "expertOWL": UserRank(rank: "Expert", avatarPath: AppPaths.expertOWL),
  "expertDOLPHIN": UserRank(rank: "Expert", avatarPath: AppPaths.expertDOLPHIN),
  "expertDRAGON": UserRank(rank: "Expert", avatarPath: AppPaths.expertDRAGON),
  "expertBIRD": UserRank(rank: "Expert", avatarPath: AppPaths.expertBIRD),
  "expertELEPHANT":
      UserRank(rank: "Expert", avatarPath: AppPaths.expertELEPHANT),

  // master
  "masterLION": UserRank(rank: "Master", avatarPath: AppPaths.masterLION),
  "masterOWL": UserRank(rank: "Master", avatarPath: AppPaths.masterOWL),
  "masterDOLPHIN": UserRank(rank: "Master", avatarPath: AppPaths.masterDOLPHIN),
  "masterDRAGON": UserRank(rank: "Master", avatarPath: AppPaths.masterDRAGON),
  "masterBIRD": UserRank(rank: "Master", avatarPath: AppPaths.masterBIRD),
  "masterELEPHANT":
      UserRank(rank: "Master", avatarPath: AppPaths.masterELEPHANT),

  // unimagined
  "unimaginedLION":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedLION),
  "unimaginedOWL":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedOWL),
  "unimaginedDOLPHIN":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedDOLPHIN),
  "unimaginedDRAGON":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedDRAGON),
  "unimaginedBIRD":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedBIRD),
  "unimaginedELEPHANT":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedELEPHANT),
};
