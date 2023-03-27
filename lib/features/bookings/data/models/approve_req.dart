class ApproveReq {
  int? booking;

  ApproveReq({this.booking});

  ApproveReq.fromJson(Map<String, dynamic> json) {
    booking = json['booking'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking'] = this.booking;
    return data;
  }
}
