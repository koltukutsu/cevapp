import 'package:cevapp/ui/constants/app_paths.dart';

class GetAvatarPaths {
  String getNoviceAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.noviceLION;
    } else if (type == "OWL") {
      return AppPaths.noviceOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.noviceDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.noviceDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.noviceBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.noviceELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }
  String getBeginnerAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.beginnerLION;
    } else if (type == "OWL") {
      return AppPaths.beginnerOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.beginnerDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.beginnerDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.beginnerBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.beginnerELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getCompetentAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.competentLION;
    } else if (type == "OWL") {
      return AppPaths.competentOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.competentDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.competentDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.competentBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.competentELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getProficientAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.proficientLION;
    } else if (type == "OWL") {
      return AppPaths.proficientOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.proficientDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.proficientDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.proficientBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.proficientELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getExpertAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.expertLION;
    } else if (type == "OWL") {
      return AppPaths.expertOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.expertDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.expertDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.expertBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.expertELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getMasterAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.masterLION;
    } else if (type == "OWL") {
      return AppPaths.masterOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.masterDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.masterDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.masterBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.masterELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }

  String getUnimaginedAvatarPath({required String type}) {
    if (type == "LION") {
      return AppPaths.unimaginedLION;
    } else if (type == "OWL") {
      return AppPaths.unimaginedOWL;
    } else if (type == "DOLPHIN") {
      return AppPaths.unimaginedDOLPHIN;
    } else if (type == "DRAGON") {
      return AppPaths.unimaginedDRAGON;
    } else if (type == "BIRD") {
      return AppPaths.unimaginedBIRD;
    } else if (type == "ELEPHANT") {
      return AppPaths.unimaginedELEPHANT;
    } else {
      return "UNKNOWN";
    }
  }
}