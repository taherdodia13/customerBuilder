import 'package:cutomer_builder/utils/exports.dart';

class CustomerDetails extends StatelessWidget {
  final DataList customer;

  const CustomerDetails({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.find<CreateCustomerController>().name.text =
                  customer.name?.trim() ?? '';
              Get.find<CreateCustomerController>().email.text =
                  customer.email?.trim() ?? '';
              Get.find<CreateCustomerController>().desc.text =
                  customer.desc?.trim() ?? '';
              Get.find<CreateCustomerController>().phone.text =
                  customer.phone.toString();
              Get.find<CreateCustomerController>().customer = customer;
              Get.find<CreateCustomerController>().isUpdating = true;
              Get.toNamed(
                AppPages.createCustomer,
                arguments: customer,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetail('Name', customer.name?.trim() ?? ''),
            const SizedBox(height: 20),
            _buildDetail('Email', customer.email?.trim() ?? ''),
            const SizedBox(height: 20),
            _buildDetail('Phone', customer.phone.toString()),
            const SizedBox(height: 20),
            _buildDetail('Description', customer.desc?.trim() ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
