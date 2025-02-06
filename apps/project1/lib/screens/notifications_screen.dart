import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'avatar': 'assets/erik-lucatero-d2MSDujJl2g-unsplash.jpg',
        'message': 'You received a payment of ',
        'amount': '\$120.00',
        'subMessage': 'from Jhon Smith',
        'time': '08:30 AM',
        'showPayButton': false,
      },
      {
        'avatar': 'assets/houcine-ncib-B4TjXnI0Y2c-unsplash.jpg',
        'message': 'James Smith request ',
        'amount': '\$450.00',
        'subMessage': 'as a payment',
        'time': '07:00 AM',
        'showPayButton': true,
        'payButtonColor': const Color(0xFFFF9B9B),
      },
      {
        'avatar': 'assets/imansyah-muhamad-putera-n4KewLKFOZw-unsplash.jpg',
        'message': 'Your new payment method has ',
        'amount': 'been added successfully',
        'subMessage': '',
        'time': '05:30 AM',
        'showPayButton': false,
      },
      {
        'avatar': 'assets/jurica-koletic-7YVZYZeITc8-unsplash.jpg',
        'message': 'You received a payment of ',
        'amount': '\$400.00',
        'subMessage': 'for William Henry',
        'time': '08:59 AM',
        'showPayButton': false,
      },
      {
        'avatar': 'assets/omid-armin-xOjzehJ49Hk-unsplash.jpg',
        'message': 'Mithun kumar requested ',
        'amount': '\$360.00',
        'subMessage': 'as a payment',
        'time': '7 March 2024',
        'showPayButton': true,
        'payButtonColor': const Color(0xFF91F5E6),
        'payButtonText': 'Paid',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) => _buildNotificationItem(notifications[index]),
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(notification['avatar']),
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.8),
              height: 1.4,
            ),
            children: [
              TextSpan(text: notification['message']),
              TextSpan(
                text: notification['amount'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['subMessage'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.8),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              notification['time'],
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        trailing: notification['showPayButton'] == true
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: notification['payButtonColor'],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: notification['payButtonColor'].withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  notification['payButtonText'] ?? 'Pay',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
