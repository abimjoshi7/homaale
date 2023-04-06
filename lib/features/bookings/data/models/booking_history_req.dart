class BookingHistoryReq {
  String? assignedFrom;
  String? assignedTo;
  String? assignedToMe;
  String? assignee;
  String? assigner;
  String? category;
  String? endDate;
  bool? isActive;
  bool? isRequested;
  String? ordering;
  int? page;
  int? pageSize;
  String? search;
  String? service;
  String? status;

  BookingHistoryReq(
      {this.assignedFrom,
      this.assignedTo,
      this.assignedToMe,
      this.assignee,
      this.assigner,
      this.category,
      this.endDate,
      this.isActive,
      this.isRequested,
      this.ordering,
      this.page,
      this.pageSize,
      this.search,
      this.service,
      this.status});

  BookingHistoryReq.fromJson(Map<String, dynamic> json) {
    assignedFrom = json['assigned_from'] as String;
    assignedTo = json['assigned_to'] as String;
    assignedToMe = json['assigned_to_me'] as String;
    assignee = json['assignee'] as String;
    assigner = json['assigner'] as String;
    category = json['category'] as String;
    endDate = json['end_date'] as String;
    isActive = json['is_active'] as bool;
    isRequested = json['is_requested'] as bool;
    ordering = json['ordering'] as String;
    page = json['page'] as int;
    pageSize = json['page_size'] as int;
    search = json['search'] as String;
    service = json['service'] as String;
    status = json['status'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assigned_from'] = this.assignedFrom;
    data['assigned_to'] = this.assignedTo;
    data['assigned_to_me'] = this.assignedToMe;
    data['assignee'] = this.assignee;
    data['assigner'] = this.assigner;
    data['category'] = this.category;
    data['end_date'] = this.endDate;
    data['is_active'] = this.isActive;
    data['is_requested'] = this.isRequested;
    data['ordering'] = this.ordering;
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    data['search'] = this.search;
    data['service'] = this.service;
    data['status'] = this.status;
    return data;
  }
}
