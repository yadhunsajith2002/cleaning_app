class ServiceModel {
  final String name;
  final String imageUrl;
  final String? rate;
  final String? description;

  ServiceModel({
    required this.name,
    required this.imageUrl,
    this.rate,
    this.description,
  });
}
