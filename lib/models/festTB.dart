class FestTB {
  int? festId;
  String? festName;
  String? userDetail;
  int? festNumday;
  int? festCost;
  int? userId;
  String? festState;
  String? festImage;

  FestTB(
      {this.festId,
      this.festName,
      this.userDetail,
      this.festNumday,
      this.festCost,
      this.userId,
      this.festState,
      this.festImage});

  FestTB.fromJson(Map<String, dynamic> json) {
    festId = json['festId'];
    festName = json['festName'];
    userDetail = json['userDetail'];
    festNumday = json['festNumday'];
    festCost = json['festCost'];
    userId = json['userId'];
    festState = json['festState'];
    festImage = json['festImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['festId'] = this.festId;
    data['festName'] = this.festName;
    data['userDetail'] = this.userDetail;
    data['festNumday'] = this.festNumday;
    data['festCost'] = this.festCost;
    data['userId'] = this.userId;
    data['festState'] = this.festState;
    data['festImage'] = this.festImage;
    return data;
  }
}
