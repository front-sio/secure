class ServiceRequest {
  final String? id;
  final String providerId;
  final String serviceId;
  final String status;
  final String location;
  final String providerName;
  final DateTime requestTime;

  ServiceRequest({
    this.id,
    required this.providerId,
    required this.serviceId,
    required this.status,
    required this.location,
    required this.providerName,
    required this.requestTime,
  });

  // Factory constructor to create a ServiceRequest from a map
  factory ServiceRequest.fromMap(String documentId, Map<String, dynamic> map) {
    return ServiceRequest(
      id: documentId,
      providerId: map['providerId'] ?? '',
      serviceId: map['serviceId'] ?? '',
      status: map['status'] ?? '',
      location: map['location'] ?? '',
      providerName: map['providerName'] ?? '',
      requestTime: DateTime.parse(map['requestTime'] ?? ''),
    );
  }

  // Method to convert ServiceRequest to a map
  Map<String, dynamic> toMap() {
    return {
      'providerId': providerId,
      'serviceId': serviceId,
      'status': status,
      'location': location,
      'providerName': providerName,
      'requestTime': requestTime.toIso8601String(),
    };
  }
}
