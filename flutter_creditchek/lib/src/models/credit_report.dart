import 'package:json_annotation/json_annotation.dart';

part 'credit_report.g.dart';

@JsonSerializable(explicitToJson: true)
class CreditReport {
  final bool status;
  final CreditReportData data;
  final String message;
  final bool error;

  CreditReport({
    required this.status,
    required this.data,
    required this.message,
    required this.error,
  });

  factory CreditReport.fromJson(Map<String, dynamic> json) =>
      _$CreditReportFromJson(json);
  Map<String, dynamic> toJson() => _$CreditReportToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditReportData {
  final String? id;
  final String? bvn;
  final String? businessId;
  final String? name;
  final String? phone;
  final String? gender;
  final String? dateOfBirth;
  final String? address;
  final String? email;
  final CreditScore score;
  final DateTime? searchedDate;
  final DateTime? lastUpdatedAt;

  CreditReportData({
    @JsonKey(name: '_id') this.id,
    this.bvn,
    this.businessId,
    this.name,
    this.phone,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.email,
    required this.score,
    this.searchedDate,
    this.lastUpdatedAt,
  });

  factory CreditReportData.fromJson(Map<String, dynamic> json) =>
      _$CreditReportDataFromJson(json);
  Map<String, dynamic> toJson() => _$CreditReportDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditScore {
  final List<ScoreValue>? totalNoOfLoans;
  final List<ScoreValue>? totalNoOfInstitutions;
  final List<ScoreValue>? totalNoOfActiveLoans;
  final List<ScoreValue>? totalBorrowed;
  final List<ScoreValue>? totalOutstanding;
  final List<ScoreValue>? highestLoanAmount;
  final List<ScoreValue>? totalOverdue;
  final List<ScoreValue>? totalNoOfClosedLoans;
  final List<ScoreValue>? totalNoOfPerformingLoans;
  final List<ScoreValue>? totalNoOfDelinquentFacilities;
  final List<ScoreValue>? totalMonthlyInstallment;
  final List<ScoreValue>? totalNoOfOverdueAccounts;
  final List<ScoreValue>? maxNoOfDays;

  final List<LoanHistorySource>? loanHistory;
  final List<LoanPerformanceSource>? loanPerformance;
  final List<CreditEnquiriesSource>? creditEnquiries;
  final List<EmploymentHistorySource>? employmentHistory;
  final List<CreditorsSource>? creditors;
  final List<CreditEnquirySummarySource>? creditEnquiriesSummary;
  final List<ScoreValue>? lastReportedDate;
  final BureauStatus? bureauStatus;

  CreditScore({
    this.totalNoOfLoans,
    this.totalNoOfInstitutions,
    this.totalNoOfActiveLoans,
    this.totalBorrowed,
    this.totalOutstanding,
    this.highestLoanAmount,
    this.totalOverdue,
    this.totalNoOfClosedLoans,
    this.totalNoOfPerformingLoans,
    this.totalNoOfDelinquentFacilities,
    this.totalMonthlyInstallment,
    this.totalNoOfOverdueAccounts,
    this.maxNoOfDays,
    this.loanHistory,
    this.loanPerformance,
    this.creditEnquiries,
    this.employmentHistory,
    this.creditors,
    this.creditEnquiriesSummary,
    this.lastReportedDate,
    this.bureauStatus,
  });

  factory CreditScore.fromJson(Map<String, dynamic> json) =>
      _$CreditScoreFromJson(json);
  Map<String, dynamic> toJson() => _$CreditScoreToJson(this);
}

@JsonSerializable()
class ScoreValue {
  final String source;
  final dynamic value;

  ScoreValue({required this.source, this.value});

  factory ScoreValue.fromJson(Map<String, dynamic> json) =>
      _$ScoreValueFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreValueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoanHistorySource {
  final String source;
  final dynamic value;

  LoanHistorySource({required this.source, this.value});

  factory LoanHistorySource.fromJson(Map<String, dynamic> json) =>
      _$LoanHistorySourceFromJson(json);
  Map<String, dynamic> toJson() => _$LoanHistorySourceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoanPerformanceSource {
  final String source;
  final dynamic value;

  LoanPerformanceSource({required this.source, this.value});

  factory LoanPerformanceSource.fromJson(Map<String, dynamic> json) =>
      _$LoanPerformanceSourceFromJson(json);
  Map<String, dynamic> toJson() => _$LoanPerformanceSourceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditEnquiriesSource {
  final String source;
  final dynamic value;

  CreditEnquiriesSource({required this.source, this.value});

  factory CreditEnquiriesSource.fromJson(Map<String, dynamic> json) =>
      _$CreditEnquiriesSourceFromJson(json);
  Map<String, dynamic> toJson() => _$CreditEnquiriesSourceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EmploymentHistorySource {
  final String source;
  final dynamic value;

  EmploymentHistorySource({required this.source, this.value});

  factory EmploymentHistorySource.fromJson(Map<String, dynamic> json) =>
      _$EmploymentHistorySourceFromJson(json);
  Map<String, dynamic> toJson() => _$EmploymentHistorySourceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditorsSource {
  final String source;
  final dynamic value;

  CreditorsSource({required this.source, this.value});

  factory CreditorsSource.fromJson(Map<String, dynamic> json) =>
      _$CreditorsSourceFromJson(json);
  Map<String, dynamic> toJson() => _$CreditorsSourceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditEnquirySummarySource {
  final String source;
  final dynamic value;

  CreditEnquirySummarySource({required this.source, this.value});

  factory CreditEnquirySummarySource.fromJson(Map<String, dynamic> json) =>
      _$CreditEnquirySummarySourceFromJson(json);
  Map<String, dynamic> toJson() => _$CreditEnquirySummarySourceToJson(this);
}

@JsonSerializable()
class BureauStatus {
  final String? creditRegistry;
  final String? firstCentral;

  BureauStatus({this.creditRegistry, this.firstCentral});

  factory BureauStatus.fromJson(Map<String, dynamic> json) =>
      _$BureauStatusFromJson(json);
  Map<String, dynamic> toJson() => _$BureauStatusToJson(this);
}
