import 'package:cevapp/ui/constants/app_paths.dart';

class UserRank {
  final String rank;
  final String avatarPath;

  UserRank({required this.rank, required this.avatarPath});
}

class UserRankLevels {
  static const int novice = 0;
  static const int beginner = 1; // 5
  static const int competent = 2; // 15
  static const int proficient = 3; // 30
  static const int expert = 4; // 50
  static const int master = 5; // 75
  static const int unimagined = 7; // 100
}

final Map<String, UserRank> userRanksObject = {
  // novice
  "NOVICE_LION": UserRank(rank: "Novice", avatarPath: AppPaths.noviceLION),
  "NOVICE_OWL": UserRank(rank: "Novice", avatarPath: AppPaths.noviceOWL),
  "NOVICE_DOLPHIN":
      UserRank(rank: "Novice", avatarPath: AppPaths.noviceDOLPHIN),
  "NOVICE_DRAGON": UserRank(rank: "Novice", avatarPath: AppPaths.noviceDRAGON),
  "NOVICE_BIRD": UserRank(rank: "Novice", avatarPath: AppPaths.noviceBIRD),
  "NOVICE_ELEPHANT":
      UserRank(rank: "Novice", avatarPath: AppPaths.noviceELEPHANT),

  // beginner
  "BEGINNER_LION":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerLION),
  "BEGINNER_OWL": UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerOWL),
  "BEGINNER_DOLPHIN":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerDOLPHIN),
  "BEGINNER_DRAGON":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerDRAGON),
  "BEGINNER_BIRD":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerBIRD),
  "BEGINNER_ELEPHANT":
      UserRank(rank: "Beginner", avatarPath: AppPaths.beginnerELEPHANT),

  // competent
  "COMPETENT_LION":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentLION),
  "COMPETENT_OWL":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentOWL),
  "COMPETENT_DOLPHIN":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentDOLPHIN),
  "COMPETENT_DRAGON":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentDRAGON),
  "COMPETENT_BIRD":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentBIRD),
  "COMPETENT_ELEPHANT":
      UserRank(rank: "Competent", avatarPath: AppPaths.competentELEPHANT),

  // proficient

  "PROFICIENT_LION":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientLION),
  "PROFICIENT_OWL":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientOWL),
  "PROFICIENT_DOLPHIN":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientDOLPHIN),
  "PROFICIENT_DRAGON":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientDRAGON),
  "PROFICIENT_BIRD":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientBIRD),
  "PROFICIENT_ELEPHANT":
      UserRank(rank: "Proficient", avatarPath: AppPaths.proficientELEPHANT),

  // expert
  "EXPERT_LION": UserRank(rank: "Expert", avatarPath: AppPaths.expertLION),
  "EXPERT_OWL": UserRank(rank: "Expert", avatarPath: AppPaths.expertOWL),
  "EXPERT_DOLPHIN":
      UserRank(rank: "Expert", avatarPath: AppPaths.expertDOLPHIN),
  "EXPERT_DRAGON": UserRank(rank: "Expert", avatarPath: AppPaths.expertDRAGON),
  "EXPERT_BIRD": UserRank(rank: "Expert", avatarPath: AppPaths.expertBIRD),
  "EXPERT_ELEPHANT":
      UserRank(rank: "Expert", avatarPath: AppPaths.expertELEPHANT),

  // master
  "MASTER_LION": UserRank(rank: "Master", avatarPath: AppPaths.masterLION),
  "MASTER_OWL": UserRank(rank: "Master", avatarPath: AppPaths.masterOWL),
  "MASTER_DOLPHIN":
      UserRank(rank: "Master", avatarPath: AppPaths.masterDOLPHIN),
  "MASTER_DRAGON": UserRank(rank: "Master", avatarPath: AppPaths.masterDRAGON),
  "MASTER_BIRD": UserRank(rank: "Master", avatarPath: AppPaths.masterBIRD),
  "MASTER_ELEPHANT":
      UserRank(rank: "Master", avatarPath: AppPaths.masterELEPHANT),

  // unimagined
  "UNIMAGINED_LION":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedLION),
  "UNIMAGINED_OWL":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedOWL),
  "UNIMAGINED_DOLPHIN":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedDOLPHIN),
  "UNIMAGINED_DRAGON":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedDRAGON),
  "UNIMAGINED_BIRD":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedBIRD),
  "UNIMAGINED_ELEPHANT":
      UserRank(rank: "Unimagined", avatarPath: AppPaths.unimaginedELEPHANT),
};
