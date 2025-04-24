class Fest {
  int? festId;
  String? festName;
  String? festDetail;
  int? festNumday;
  double? festCost;
  int? userId;
  String? festState;
  String? festImage;

  Fest(
      {this.festId,
      this.festName,
      this.festDetail,
      this.festNumday,
      this.festCost,
      this.userId,
      this.festState,
      this.festImage});

  Fest.fromJson(Map<String, dynamic> json) {
    festId = json['festId'];
    festName = json['festName'];
    festDetail = json['festDetail'];
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
    data['festDetail'] = this.festDetail;
    data['festNumday'] = this.festNumday;
    data['festCost'] = this.festCost;
    data['userId'] = this.userId;
    data['festState'] = this.festState;
    data['festImage'] = this.festImage;
    return data;
  }
}
