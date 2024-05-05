import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure/common/widgets/appbar/appbar.dart';
import 'package:secure/inlyfe/screens/request_detail/request_detail.dart';

import '../../controllers/service_request_controller.dart';
import '../../models/serviceRequest.dart';

class MyRequestsScreen extends StatelessWidget {

  MyRequestsScreen({super.key});
  final ServiceRequestController _controller = Get.put(ServiceRequestController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SeAppBar(showBackArrow: false, title: Text('My Requsts'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetX<ServiceRequestController>( // Change to ServiceRequestController
          init: ServiceRequestController(), // Change to ServiceRequestController
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.requests.length,
              itemBuilder: (context, index) {
                ServiceRequest request = controller.requests[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => RequestDetailScreen(requestId: request.id!));
                  },
                  child: ListTile(
                    title: Text('Service Request ${index + 1}'),
                    subtitle: Text('Provider ID: ${request.providerId}\nService ID: ${request.serviceId}\nRequest Time: ${request.requestTime.toString()}'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
