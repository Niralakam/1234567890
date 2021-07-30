class DamageModel {
  int vestLevel;
  int helmetLevel;
  int distance;
  List<DamageDetailsModel> data;
  DamageModel({
    this.vestLevel,
    this.helmetLevel,
    this.distance,
    this.data,
  });
}

class DamageDetailsModel {
  String weapon;
  String head;
  String neck;
  String clavicles;
  String upperChest;
  String lowerChest;
  String stomach;
  String pelvis;
  String upperLimb;
  String lowerLimb;
  String handFoot;
  DamageDetailsModel({
    this.weapon,
    this.head,
    this.neck,
    this.clavicles,
    this.upperChest,
    this.lowerChest,
    this.stomach,
    this.pelvis,
    this.upperLimb,
    this.lowerLimb,
    this.handFoot,
  });
}
