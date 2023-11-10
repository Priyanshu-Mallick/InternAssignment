import 'package:flutter/material.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'assets/ex.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(fontSize: screenHeight * 0.017),
                  tabs: const [
                    Tab(
                      text: 'Role',
                    ),
                    Tab(
                      text: 'Permissions',
                    ),
                    Tab(
                      text: 'Members',
                    ),
                  ],
                  indicator: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  physics: BouncingScrollPhysics(),
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            RoleContent(),
            PermissionsContent(),
            MembersContent(),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: _tabBar,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class PermissionsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General Permissions",
              style: TextStyle(
                fontSize: 17,
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
            PermissionListItem(name: "Permission 3"),
            PermissionListItem(name: "Permission 1"),
            PermissionListItem(name: "Permission 2"),
            PermissionListItem(name: "Permission 3"),
            PermissionListItem(name: "Permission 1"),
            PermissionListItem(name: "Permission 2"),
            PermissionListItem(name: "Permission 3"),
            PermissionListItem(name: "Permission 3"),
            PermissionListItem(name: "Permission 1"),
            PermissionListItem(name: "Permission 2"),
            PermissionListItem(name: "Permission 3"),
            // Add more items as needed
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSwitched = !isSwitched;
              });
            },
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isSwitched ? Colors.blue : Colors.grey[350],
                border: Border.all(
                  color: isSwitched ? Colors.blue : Colors.grey[350]!,
                  width: 2.0,
                ),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    left: isSwitched ? 30 : 0,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return RotationTransition(
                          child: child,
                          turns: animation,
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSwitched = !isSwitched;
                          });
                        },
                        child: Center(
                          child: Icon(
                            isSwitched ? Icons.circle : Icons.circle,
                            color: Colors.white,
                            size: 26.0,
                            key: ValueKey<bool>(isSwitched),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
