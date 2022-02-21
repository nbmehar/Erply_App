// To parse this JSON data, do
//
//     final getallCustomers = getallCustomersFromMap(jsonString);

import 'dart:convert';

List<GetallCustomers> getallCustomersFromMap(String str) => List<GetallCustomers>.from(json.decode(str).map((x) => GetallCustomers.fromMap(x)));

String getallCustomersToMap(List<GetallCustomers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class GetallCustomers {
    GetallCustomers({
        this.id,
        this.customerType,
        this.businessTypeId,
        this.customerGroupId,
        this.businessAreaId,
        this.jobTitleId,
        this.employerId,
        this.customerManagerId,
        this.titleId,
        this.eInvoiceEmail,
        this.eInvoicesViaEmailEnabled,
        this.invoicesViaEmailEnabled,
        this.paperMailsEnabled,
        this.operatorId,
        this.ediCode,
        this.lastName,
        this.firstName,
        this.fullName,
        this.businessName,
        this.code,
        this.birthDate,
        this.vatNumber,
        this.bankName,
        this.bankAccountNumber,
        this.bankSwiftCode,
        this.bankIban,
        this.phone,
        this.mobile,
        this.fax,
        this.mail,
        this.skype,
        this.website,
        this.notes,
        this.webShopUsername,
        this.salesForCashOnly,
        this.creditLimit,
        this.defaultPaymentDeadLine,
        this.penaltyForOverdue,
        this.payerId,
        this.countryId,
        this.homeStoreId,
        this.referenceNumber,
        this.integrationCode,
        this.loyaltyCardNumber,
        this.factoringContractNumber,
        this.type,
        this.priceListId,
        this.priceListId2,
        this.priceListId3,
        this.taxOfficeId,
        this.color,
        this.twitterId,
        this.facebookName,
        this.taxExempt,
        this.paysViaFactoring,
        this.gln,
        this.deliveryTypeId,
        this.shipGoodsWithWaybills,
        this.customerBalanceDisabled,
        this.rewardPointsDisabled,
        this.posCouponsDisabled,
        this.emailOptOut,
        this.signUpStoreId,
        this.gender,
        this.isStarred,
        this.salesDisabled,
        this.eInvoiceReference,
        this.invoicesViaDocuraEnabled,
        this.ediType,
        this.added,
        this.changed,
        this.changedBy,
    });

    int? id;
    CustomerType? customerType;
    int? businessTypeId;
    int? customerGroupId;
    int? businessAreaId;
    int? jobTitleId;
    int? employerId;
    int? customerManagerId;
    int? titleId;
    String? eInvoiceEmail;
    bool? eInvoicesViaEmailEnabled;
    bool? invoicesViaEmailEnabled;
    bool? paperMailsEnabled;
    String? operatorId;
    String? ediCode;
    String? lastName;
    String? firstName;
    String? fullName;
    String? businessName;
    String? code;
    String? birthDate;
    String? vatNumber;
    String? bankName;
    String? bankAccountNumber;
    String? bankSwiftCode;
    String? bankIban;
    String? phone;
    String? mobile;
    String? fax;
    String? mail;
    String? skype;
    String? website;
    String? notes;
    String? webShopUsername;
    bool? salesForCashOnly;
    int? creditLimit;
    int? defaultPaymentDeadLine;
    int? penaltyForOverdue;
    int? payerId;
    int? countryId;
    int? homeStoreId;
    String? referenceNumber;
    String? integrationCode;
    String? loyaltyCardNumber;
    String? factoringContractNumber;
    Type? type;
    int? priceListId;
    int? priceListId2;
    int? priceListId3;
    int? taxOfficeId;
    Color? color;
    String? twitterId;
    String? facebookName;
    bool? taxExempt;
    bool? paysViaFactoring;
    String? gln;
    int? deliveryTypeId;
    bool? shipGoodsWithWaybills;
    bool? customerBalanceDisabled;
    bool? rewardPointsDisabled;
    bool? posCouponsDisabled;
    bool? emailOptOut;
    int? signUpStoreId;
    Gender? gender;
    bool? isStarred;
    bool? salesDisabled;
    String? eInvoiceReference;
    bool? invoicesViaDocuraEnabled;
    String? ediType;
    int? added;
    int? changed;
    ChangedBy? changedBy;

    factory GetallCustomers.fromMap(Map<String, dynamic> json) => GetallCustomers(
        id: json["id"] == null ? null : json["id"],
        customerType: json["customerType"] == null ? null : customerTypeValues.map[json["customerType"]],
        businessTypeId: json["businessTypeId"] == null ? null : json["businessTypeId"],
        customerGroupId: json["customerGroupId"] == null ? null : json["customerGroupId"],
        businessAreaId: json["businessAreaId"] == null ? null : json["businessAreaId"],
        jobTitleId: json["jobTitleId"] == null ? null : json["jobTitleId"],
        employerId: json["employerId"] == null ? null : json["employerId"],
        customerManagerId: json["customerManagerId"] == null ? null : json["customerManagerId"],
        titleId: json["titleId"] == null ? null : json["titleId"],
        eInvoiceEmail: json["eInvoiceEmail"] == null ? null : json["eInvoiceEmail"],
        eInvoicesViaEmailEnabled: json["eInvoicesViaEmailEnabled"] == null ? null : json["eInvoicesViaEmailEnabled"],
        invoicesViaEmailEnabled: json["invoicesViaEmailEnabled"] == null ? null : json["invoicesViaEmailEnabled"],
        paperMailsEnabled: json["paperMailsEnabled"] == null ? null : json["paperMailsEnabled"],
        operatorId: json["operatorId"] == null ? null : json["operatorId"],
        ediCode: json["ediCode"] == null ? null : json["ediCode"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        businessName: json["businessName"] == null ? null : json["businessName"],
        code: json["code"] == null ? null : json["code"],
        birthDate: json["birthDate"] == null ? null : json["birthDate"],
        vatNumber: json["vatNumber"] == null ? null : json["vatNumber"],
        bankName: json["bankName"] == null ? null : json["bankName"],
        bankAccountNumber: json["bankAccountNumber"] == null ? null : json["bankAccountNumber"],
        bankSwiftCode: json["bankSwiftCode"] == null ? null : json["bankSwiftCode"],
        bankIban: json["bankIban"] == null ? null : json["bankIban"],
        phone: json["phone"] == null ? null : json["phone"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        fax: json["fax"] == null ? null : json["fax"],
        mail: json["mail"] == null ? null : json["mail"],
        skype: json["skype"] == null ? null : json["skype"],
        website: json["website"] == null ? null : json["website"],
        notes: json["notes"] == null ? null : json["notes"],
        webShopUsername: json["webShopUsername"] == null ? null : json["webShopUsername"],
        salesForCashOnly: json["salesForCashOnly"] == null ? null : json["salesForCashOnly"],
        creditLimit: json["creditLimit"] == null ? null : json["creditLimit"],
        defaultPaymentDeadLine: json["defaultPaymentDeadLine"] == null ? null : json["defaultPaymentDeadLine"],
        penaltyForOverdue: json["penaltyForOverdue"] == null ? null : json["penaltyForOverdue"],
        payerId: json["payerId"] == null ? null : json["payerId"],
        countryId: json["countryId"] == null ? null : json["countryId"],
        homeStoreId: json["homeStoreId"] == null ? null : json["homeStoreId"],
        referenceNumber: json["referenceNumber"] == null ? null : json["referenceNumber"],
        integrationCode: json["integrationCode"] == null ? null : json["integrationCode"],
        loyaltyCardNumber: json["loyaltyCardNumber"] == null ? null : json["loyaltyCardNumber"],
        factoringContractNumber: json["factoringContractNumber"] == null ? null : json["factoringContractNumber"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        priceListId: json["priceListId"] == null ? null : json["priceListId"],
        priceListId2: json["priceListId2"] == null ? null : json["priceListId2"],
        priceListId3: json["priceListId3"] == null ? null : json["priceListId3"],
        taxOfficeId: json["taxOfficeId"] == null ? null : json["taxOfficeId"],
        color: json["color"] == null ? null : colorValues.map[json["color"]],
        twitterId: json["twitterId"] == null ? null : json["twitterId"],
        facebookName: json["facebookName"] == null ? null : json["facebookName"],
        taxExempt: json["taxExempt"] == null ? null : json["taxExempt"],
        paysViaFactoring: json["paysViaFactoring"] == null ? null : json["paysViaFactoring"],
        gln: json["GLN"] == null ? null : json["GLN"],
        deliveryTypeId: json["deliveryTypeId"] == null ? null : json["deliveryTypeId"],
        shipGoodsWithWaybills: json["shipGoodsWithWaybills"] == null ? null : json["shipGoodsWithWaybills"],
        customerBalanceDisabled: json["customerBalanceDisabled"] == null ? null : json["customerBalanceDisabled"],
        rewardPointsDisabled: json["rewardPointsDisabled"] == null ? null : json["rewardPointsDisabled"],
        posCouponsDisabled: json["posCouponsDisabled"] == null ? null : json["posCouponsDisabled"],
        emailOptOut: json["emailOptOut"] == null ? null : json["emailOptOut"],
        signUpStoreId: json["signUpStoreId"] == null ? null : json["signUpStoreId"],
        gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
        isStarred: json["isStarred"] == null ? null : json["isStarred"],
        salesDisabled: json["salesDisabled"] == null ? null : json["salesDisabled"],
        eInvoiceReference: json["eInvoiceReference"] == null ? null : json["eInvoiceReference"],
        invoicesViaDocuraEnabled: json["invoicesViaDocuraEnabled"] == null ? null : json["invoicesViaDocuraEnabled"],
        ediType: json["ediType"] == null ? null : json["ediType"],
        added: json["added"] == null ? null : json["added"],
        changed: json["changed"] == null ? null : json["changed"],
        changedBy: json["changedBy"] == null ? null : changedByValues.map[json["changedBy"]],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "customerType": customerType == null ? null : customerTypeValues.reverse[customerType],
        "businessTypeId": businessTypeId == null ? null : businessTypeId,
        "customerGroupId": customerGroupId == null ? null : customerGroupId,
        "businessAreaId": businessAreaId == null ? null : businessAreaId,
        "jobTitleId": jobTitleId == null ? null : jobTitleId,
        "employerId": employerId == null ? null : employerId,
        "customerManagerId": customerManagerId == null ? null : customerManagerId,
        "titleId": titleId == null ? null : titleId,
        "eInvoiceEmail": eInvoiceEmail == null ? null : eInvoiceEmail,
        "eInvoicesViaEmailEnabled": eInvoicesViaEmailEnabled == null ? null : eInvoicesViaEmailEnabled,
        "invoicesViaEmailEnabled": invoicesViaEmailEnabled == null ? null : invoicesViaEmailEnabled,
        "paperMailsEnabled": paperMailsEnabled == null ? null : paperMailsEnabled,
        "operatorId": operatorId == null ? null : operatorId,
        "ediCode": ediCode == null ? null : ediCode,
        "lastName": lastName == null ? null : lastName,
        "firstName": firstName == null ? null : firstName,
        "fullName": fullName == null ? null : fullName,
        "businessName": businessName == null ? null : businessName,
        "code": code == null ? null : code,
        "birthDate": birthDate == null ? null : birthDate,
        "vatNumber": vatNumber == null ? null : vatNumber,
        "bankName": bankName == null ? null : bankName,
        "bankAccountNumber": bankAccountNumber == null ? null : bankAccountNumber,
        "bankSwiftCode": bankSwiftCode == null ? null : bankSwiftCode,
        "bankIban": bankIban == null ? null : bankIban,
        "phone": phone == null ? null : phone,
        "mobile": mobile == null ? null : mobile,
        "fax": fax == null ? null : fax,
        "mail": mail == null ? null : mail,
        "skype": skype == null ? null : skype,
        "website": website == null ? null : website,
        "notes": notes == null ? null : notes,
        "webShopUsername": webShopUsername == null ? null : webShopUsername,
        "salesForCashOnly": salesForCashOnly == null ? null : salesForCashOnly,
        "creditLimit": creditLimit == null ? null : creditLimit,
        "defaultPaymentDeadLine": defaultPaymentDeadLine == null ? null : defaultPaymentDeadLine,
        "penaltyForOverdue": penaltyForOverdue == null ? null : penaltyForOverdue,
        "payerId": payerId == null ? null : payerId,
        "countryId": countryId == null ? null : countryId,
        "homeStoreId": homeStoreId == null ? null : homeStoreId,
        "referenceNumber": referenceNumber == null ? null : referenceNumber,
        "integrationCode": integrationCode == null ? null : integrationCode,
        "loyaltyCardNumber": loyaltyCardNumber == null ? null : loyaltyCardNumber,
        "factoringContractNumber": factoringContractNumber == null ? null : factoringContractNumber,
        "type": type == null ? null : typeValues.reverse[type],
        "priceListId": priceListId == null ? null : priceListId,
        "priceListId2": priceListId2 == null ? null : priceListId2,
        "priceListId3": priceListId3 == null ? null : priceListId3,
        "taxOfficeId": taxOfficeId == null ? null : taxOfficeId,
        "color": color == null ? null : colorValues.reverse[color],
        "twitterId": twitterId == null ? null : twitterId,
        "facebookName": facebookName == null ? null : facebookName,
        "taxExempt": taxExempt == null ? null : taxExempt,
        "paysViaFactoring": paysViaFactoring == null ? null : paysViaFactoring,
        "GLN": gln == null ? null : gln,
        "deliveryTypeId": deliveryTypeId == null ? null : deliveryTypeId,
        "shipGoodsWithWaybills": shipGoodsWithWaybills == null ? null : shipGoodsWithWaybills,
        "customerBalanceDisabled": customerBalanceDisabled == null ? null : customerBalanceDisabled,
        "rewardPointsDisabled": rewardPointsDisabled == null ? null : rewardPointsDisabled,
        "posCouponsDisabled": posCouponsDisabled == null ? null : posCouponsDisabled,
        "emailOptOut": emailOptOut == null ? null : emailOptOut,
        "signUpStoreId": signUpStoreId == null ? null : signUpStoreId,
        "gender": gender == null ? null : genderValues.reverse[gender],
        "isStarred": isStarred == null ? null : isStarred,
        "salesDisabled": salesDisabled == null ? null : salesDisabled,
        "eInvoiceReference": eInvoiceReference == null ? null : eInvoiceReference,
        "invoicesViaDocuraEnabled": invoicesViaDocuraEnabled == null ? null : invoicesViaDocuraEnabled,
        "ediType": ediType == null ? null : ediType,
        "added": added == null ? null : added,
        "changed": changed == null ? null : changed,
        "changedBy": changedBy == null ? null : changedByValues.reverse[changedBy],
    };
}

enum ChangedBy { ERPLY, SYSTEM, ERPLY2020 }

final changedByValues = EnumValues({
    "erply": ChangedBy.ERPLY,
    "erply2020": ChangedBy.ERPLY2020,
    "system": ChangedBy.SYSTEM
});

enum Color { EMPTY, YELLOW }

final colorValues = EnumValues({
    "": Color.EMPTY,
    "yellow": Color.YELLOW
});

enum CustomerType { PERSON, COMPANY }

final customerTypeValues = EnumValues({
    "COMPANY": CustomerType.COMPANY,
    "PERSON": CustomerType.PERSON
});

enum Gender { EMPTY, MALE }

final genderValues = EnumValues({
    "": Gender.EMPTY,
    "male": Gender.MALE
});

enum Type { DOMESTIC }

final typeValues = EnumValues({
    "DOMESTIC": Type.DOMESTIC
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

     EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
