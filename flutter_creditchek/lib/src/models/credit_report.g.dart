// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditReport _$CreditReportFromJson(Map<String, dynamic> json) => CreditReport(
  status: json['status'] as bool,
  data: CreditReportData.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String,
  error: json['error'] as bool,
);

Map<String, dynamic> _$CreditReportToJson(CreditReport instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.toJson(),
      'message': instance.message,
      'error': instance.error,
    };

CreditReportData _$CreditReportDataFromJson(Map<String, dynamic> json) =>
    CreditReportData(
      id: json['_id'] as String?,
      bvn: json['bvn'] as String?,
      businessId: json['businessId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      score: CreditScore.fromJson(json['score'] as Map<String, dynamic>),
      searchedDate: json['searchedDate'] == null
          ? null
          : DateTime.parse(json['searchedDate'] as String),
      lastUpdatedAt: json['lastUpdatedAt'] == null
          ? null
          : DateTime.parse(json['lastUpdatedAt'] as String),
    );

Map<String, dynamic> _$CreditReportDataToJson(CreditReportData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bvn': instance.bvn,
      'businessId': instance.businessId,
      'name': instance.name,
      'phone': instance.phone,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'address': instance.address,
      'email': instance.email,
      'score': instance.score.toJson(),
      'searchedDate': instance.searchedDate?.toIso8601String(),
      'lastUpdatedAt': instance.lastUpdatedAt?.toIso8601String(),
    };

CreditScore _$CreditScoreFromJson(Map<String, dynamic> json) => CreditScore(
  totalNoOfLoans: (json['totalNoOfLoans'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalNoOfInstitutions: (json['totalNoOfInstitutions'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalNoOfActiveLoans: (json['totalNoOfActiveLoans'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalBorrowed: (json['totalBorrowed'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalOutstanding: (json['totalOutstanding'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  highestLoanAmount: (json['highestLoanAmount'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalOverdue: (json['totalOverdue'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalNoOfClosedLoans: (json['totalNoOfClosedLoans'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalNoOfPerformingLoans: (json['totalNoOfPerformingLoans'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalNoOfDelinquentFacilities:
      (json['totalNoOfDelinquentFacilities'] as List<dynamic>?)
          ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalMonthlyInstallment: (json['totalMonthlyInstallment'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalNoOfOverdueAccounts: (json['totalNoOfOverdueAccounts'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  maxNoOfDays: (json['maxNoOfDays'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  loanHistory: (json['loanHistory'] as List<dynamic>?)
      ?.map((e) => LoanHistorySource.fromJson(e as Map<String, dynamic>))
      .toList(),
  loanPerformance: (json['loanPerformance'] as List<dynamic>?)
      ?.map((e) => LoanPerformanceSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  creditEnquiries: (json['creditEnquiries'] as List<dynamic>?)
      ?.map((e) => CreditEnquiriesSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  employmentHistory: (json['employmentHistory'] as List<dynamic>?)
      ?.map((e) => EmploymentHistorySource.fromJson(e as Map<String, dynamic>))
      .toList(),
  creditors: (json['creditors'] as List<dynamic>?)
      ?.map((e) => CreditorsSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  creditEnquiriesSummary: (json['creditEnquiriesSummary'] as List<dynamic>?)
      ?.map(
        (e) => CreditEnquirySummarySource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  lastReportedDate: (json['lastReportedDate'] as List<dynamic>?)
      ?.map((e) => ScoreValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  bureauStatus: json['bureauStatus'] == null
      ? null
      : BureauStatus.fromJson(json['bureauStatus'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreditScoreToJson(
  CreditScore instance,
) => <String, dynamic>{
  'totalNoOfLoans': instance.totalNoOfLoans?.map((e) => e.toJson()).toList(),
  'totalNoOfInstitutions': instance.totalNoOfInstitutions
      ?.map((e) => e.toJson())
      .toList(),
  'totalNoOfActiveLoans': instance.totalNoOfActiveLoans
      ?.map((e) => e.toJson())
      .toList(),
  'totalBorrowed': instance.totalBorrowed?.map((e) => e.toJson()).toList(),
  'totalOutstanding': instance.totalOutstanding
      ?.map((e) => e.toJson())
      .toList(),
  'highestLoanAmount': instance.highestLoanAmount
      ?.map((e) => e.toJson())
      .toList(),
  'totalOverdue': instance.totalOverdue?.map((e) => e.toJson()).toList(),
  'totalNoOfClosedLoans': instance.totalNoOfClosedLoans
      ?.map((e) => e.toJson())
      .toList(),
  'totalNoOfPerformingLoans': instance.totalNoOfPerformingLoans
      ?.map((e) => e.toJson())
      .toList(),
  'totalNoOfDelinquentFacilities': instance.totalNoOfDelinquentFacilities
      ?.map((e) => e.toJson())
      .toList(),
  'totalMonthlyInstallment': instance.totalMonthlyInstallment
      ?.map((e) => e.toJson())
      .toList(),
  'totalNoOfOverdueAccounts': instance.totalNoOfOverdueAccounts
      ?.map((e) => e.toJson())
      .toList(),
  'maxNoOfDays': instance.maxNoOfDays?.map((e) => e.toJson()).toList(),
  'loanHistory': instance.loanHistory?.map((e) => e.toJson()).toList(),
  'loanPerformance': instance.loanPerformance?.map((e) => e.toJson()).toList(),
  'creditEnquiries': instance.creditEnquiries?.map((e) => e.toJson()).toList(),
  'employmentHistory': instance.employmentHistory
      ?.map((e) => e.toJson())
      .toList(),
  'creditors': instance.creditors?.map((e) => e.toJson()).toList(),
  'creditEnquiriesSummary': instance.creditEnquiriesSummary
      ?.map((e) => e.toJson())
      .toList(),
  'lastReportedDate': instance.lastReportedDate
      ?.map((e) => e.toJson())
      .toList(),
  'bureauStatus': instance.bureauStatus?.toJson(),
};

ScoreValue _$ScoreValueFromJson(Map<String, dynamic> json) =>
    ScoreValue(source: json['source'] as String, value: json['value']);

Map<String, dynamic> _$ScoreValueToJson(ScoreValue instance) =>
    <String, dynamic>{'source': instance.source, 'value': instance.value};

LoanHistorySource _$LoanHistorySourceFromJson(Map<String, dynamic> json) =>
    LoanHistorySource(source: json['source'] as String, value: json['value']);

Map<String, dynamic> _$LoanHistorySourceToJson(LoanHistorySource instance) =>
    <String, dynamic>{'source': instance.source, 'value': instance.value};

LoanPerformanceSource _$LoanPerformanceSourceFromJson(
  Map<String, dynamic> json,
) => LoanPerformanceSource(
  source: json['source'] as String,
  value: json['value'],
);

Map<String, dynamic> _$LoanPerformanceSourceToJson(
  LoanPerformanceSource instance,
) => <String, dynamic>{'source': instance.source, 'value': instance.value};

CreditEnquiriesSource _$CreditEnquiriesSourceFromJson(
  Map<String, dynamic> json,
) => CreditEnquiriesSource(
  source: json['source'] as String,
  value: json['value'],
);

Map<String, dynamic> _$CreditEnquiriesSourceToJson(
  CreditEnquiriesSource instance,
) => <String, dynamic>{'source': instance.source, 'value': instance.value};

EmploymentHistorySource _$EmploymentHistorySourceFromJson(
  Map<String, dynamic> json,
) => EmploymentHistorySource(
  source: json['source'] as String,
  value: json['value'],
);

Map<String, dynamic> _$EmploymentHistorySourceToJson(
  EmploymentHistorySource instance,
) => <String, dynamic>{'source': instance.source, 'value': instance.value};

CreditorsSource _$CreditorsSourceFromJson(Map<String, dynamic> json) =>
    CreditorsSource(source: json['source'] as String, value: json['value']);

Map<String, dynamic> _$CreditorsSourceToJson(CreditorsSource instance) =>
    <String, dynamic>{'source': instance.source, 'value': instance.value};

CreditEnquirySummarySource _$CreditEnquirySummarySourceFromJson(
  Map<String, dynamic> json,
) => CreditEnquirySummarySource(
  source: json['source'] as String,
  value: json['value'],
);

Map<String, dynamic> _$CreditEnquirySummarySourceToJson(
  CreditEnquirySummarySource instance,
) => <String, dynamic>{'source': instance.source, 'value': instance.value};

BureauStatus _$BureauStatusFromJson(Map<String, dynamic> json) => BureauStatus(
  creditRegistry: json['creditRegistry'] as String?,
  firstCentral: json['firstCentral'] as String?,
);

Map<String, dynamic> _$BureauStatusToJson(BureauStatus instance) =>
    <String, dynamic>{
      'creditRegistry': instance.creditRegistry,
      'firstCentral': instance.firstCentral,
    };
