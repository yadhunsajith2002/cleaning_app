class ContractModel {
  final String servicename;
  final String serviceProvider;

  ContractModel({
    required this.servicename,
    required this.serviceProvider,
  });

  Map<String, dynamic> toJson() {
    return {
      'servicename': servicename,
      'serviceProvider': serviceProvider,
    };
  }

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      servicename: json['servicename'],
      serviceProvider: json['serviceProvider'],
    );
  }
}
