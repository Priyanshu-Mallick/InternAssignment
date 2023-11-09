import 'package:flutter/material.dart';

class AssignmentScrren extends StatefulWidget {
  const AssignmentScrren({super.key});

  @override
  State<AssignmentScrren> createState() => _AssignmentScrrenState();
}

class _AssignmentScrrenState extends State<AssignmentScrren> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Manage Role",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Add navigation logic here
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  'assets/ex.png', // Replace with the correct path to your image
                  width: double.infinity,
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.001),
              child: Container(
                height: screenHeight * 0.06,
                // Set the desired height for the TabBar
                padding: EdgeInsets.all(screenWidth * 0.008),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(fontSize: screenHeight*0.018),
                  tabs: const [
                    Tab(
                      text: 'Role',
                    ),
                    Tab(
                      text: 'Pernissions',
                    ),
                    Tab(
                      text: 'Members',
                    ),
                  ],
                  indicator: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.6,
              child: TabBarView(
                controller: _tabController,
                children: [
                  RoleContent(),
                  PermissionsContent(),
                  MembersContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Role content"),
    );
  }
}

class PermissionsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            "General Permissions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          // Example list items, replace it with your actual data
          PermissionListItem(name: "Ban Members"),
          PermissionListItem(name: "Delete others Messages"),
          PermissionListItem(name: "Pin Messages"),
          PermissionListItem(name: "Create new Roles"),
          PermissionListItem(name: "Edit Community Info"),
          PermissionListItem(name: "Permission 3"),
          PermissionListItem(name: "Permission 1"),
          PermissionListItem(name: "Permission 2"),
          PermissionListItem(name: "Permission 3"),
          PermissionListItem(name: "Permission 1"),
          PermissionListItem(name: "Permission 2"),
          PermissionListItem(name: "Permission 3"),
          // Add more items as needed
        ],
      ),
    );
  }
}

class MembersContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Members content"),
    );
  }
}

class PermissionListItem extends StatefulWidget {
  final String name;

  const PermissionListItem({required this.name});

  @override
  _PermissionListItemState createState() => _PermissionListItemState();
}

class _PermissionListItemState extends State<PermissionListItem> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.name,
          style: TextStyle(fontSize: 17, color: Colors.grey),
        ),
        Transform.scale(
          scale: 1.5,
          child: Switch(
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

