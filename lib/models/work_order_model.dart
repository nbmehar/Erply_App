import 'dart:convert';

List<WorkOrderModel> workOrderModelFromMap(String str) => List<WorkOrderModel>.from(json.decode(str).map((x) => WorkOrderModel.fromMap(x)));

String workOrderModelToMap(List<WorkOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class WorkOrderModel {
  WorkOrderModel({
    this.id,
    this.workorderNo,
    this.emsThreadId,
    this.warehouseId,
    this.customerId,
    this.contactId,
    this.deviceId,
    this.netTotal,
    this.vatTotal,
    this.total,
    this.state,
    this.receivedAt,
    this.receivedById,
    this.returnedAt,
    this.returnedById,
    this.confirmedAt,
    this.confirmedById,
    this.cancelledAt,
    this.cancelledById,
    this.createdAt,
    this.createdById,
    this.updatedAt,
    this.updatedById,
    this.noteCount,
  });

  int? id;
  String? workorderNo;
  dynamic emsThreadId;
  int? warehouseId;
  int? customerId;
  int? contactId;
  int? deviceId;
  String? netTotal;
  String? vatTotal;
  String? total;
  String? state;
  dynamic receivedAt;
  dynamic receivedById;
  dynamic returnedAt;
  dynamic returnedById;
  dynamic confirmedAt;
  dynamic confirmedById;
  dynamic cancelledAt;
  dynamic cancelledById;
  DateTime? createdAt;
  int? createdById;
  DateTime? updatedAt;
  int? updatedById;
  int? noteCount;

  factory WorkOrderModel.fromMap(Map<String, dynamic> json) => WorkOrderModel(
    id: json["id"],
    workorderNo: json["workorderNo"],
    emsThreadId: json["emsThreadId"],
    warehouseId: json["warehouseId"],
    customerId: json["customerId"],
    contactId: json["contactId"],
    deviceId: json["deviceId"] == null ? null : json["deviceId"],
    netTotal: json["netTotal"],
    vatTotal: json["vatTotal"],
    total: json["total"],
    state: json["state"],
    receivedAt: json["receivedAt"],
    receivedById: json["receivedById"],
    returnedAt: json["returnedAt"],
    returnedById: json["returnedById"],
    confirmedAt: json["confirmedAt"],
    confirmedById: json["confirmedById"],
    cancelledAt: json["cancelledAt"],
    cancelledById: json["cancelledById"],
    createdAt: DateTime.parse(json["createdAt"]),
    createdById: json["createdById"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    updatedById: json["updatedById"],
    noteCount: json["noteCount"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "workorderNo": workorderNo,
    "emsThreadId": emsThreadId,
    "warehouseId": warehouseId,
    "customerId": customerId,
    "contactId": contactId,
    "deviceId": deviceId == null ? null : deviceId,
    "netTotal": netTotal,
    "vatTotal": vatTotal,
    "total": total,
    "state": state,
    "receivedAt": receivedAt,
    "receivedById": receivedById,
    "returnedAt": returnedAt,
    "returnedById": returnedById,
    "confirmedAt": confirmedAt,
    "confirmedById": confirmedById,
    "cancelledAt": cancelledAt,
    "cancelledById": cancelledById,
    "createdAt": createdAt!.toIso8601String(),
    "createdById": createdById,
    "updatedAt": updatedAt!.toIso8601String(),
    "updatedById": updatedById,
    "noteCount": noteCount,
  };
}
