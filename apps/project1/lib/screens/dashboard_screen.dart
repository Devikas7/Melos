import 'package:flutter/material.dart';
import 'package:project1/screens/notifications_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List of Accounts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildAccountCard(amount: '4800.00', color: Colors.blue, label: 'Bank Account')),
                Expanded(child: _buildAccountCard(amount: '2000.00', color: Colors.orange, label: 'Credit Card')),
                Expanded(child: _buildAccountCard(amount: '500.00', color: Colors.green, label: 'Cash')),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '\$4800.00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Last Records Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildRecordItem(icon: Icons.shopping_cart, title: 'Groceries', method: 'Credit Card', amount: '\$250.00', color: Colors.orange),
            _buildRecordItem(icon: Icons.checkroom, title: 'Clothes', method: 'Credit Card', amount: '\$120.00', color: Colors.blue),
            _buildRecordItem(icon: Icons.home, title: 'Rental', method: 'Cash', amount: '\$800.00', color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard({required String amount, required Color color, required String label}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color.withOpacity(0.8),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
        ),
        subtitle: Text(
          '\$$amount',
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildRecordItem({required IconData icon, required String title, required String method, required String amount, required Color color}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        subtitle: Text(method, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        trailing: Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
