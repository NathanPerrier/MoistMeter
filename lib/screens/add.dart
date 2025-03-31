import 'package:flutter/material.dart';
import 'package:MoistMeter/components/navbar.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(selectedIndex: 2),
      appBar: AppBar(
        title: Center(child: const Text('Add New Field Or Crop')),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Crop'),
              Tab(text: 'Field'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Crop Form
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Crop Name',
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Crop Type',
                          ),
                        ),
                        //dropdown
                        DropdownButtonFormField(
                          value: 'Field 1',
                          items: [
                            DropdownMenuItem(child: Text('Field 1'), value: 'Field 1'),
                            DropdownMenuItem(child: Text('Field 2'), value: 'Field 2'),
                            DropdownMenuItem(child: Text('Field 3'), value: 'Field 3'),
                          ], 
                          onChanged: (value) {}
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Area (ha)',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle crop form submission
                            },
                            child: const Text('Submit Crop'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Field Form
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Field Name',
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Field Size',
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Field Coordinates',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle field form submission
                            },
                            child: const Text('Submit Field'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}