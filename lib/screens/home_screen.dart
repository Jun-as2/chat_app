import 'package:chat_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  void _onNavigationItemSelected(index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (context, value, child) => Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, value, child) {
          return Text(value.toString());
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;
  @override
  State<_BottomNavigationBar> createState() => __BottomNavigationBarState();
}

class __BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;
  void itemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                  index: 0,
                  label: 'Messages',
                  icon: CupertinoIcons.bubble_left_bubble_right_fill,
                  isSelected: (selectedIndex == 0),
                  onTap: itemSelected),
              _NavigationBarItem(
                  index: 1,
                  label: 'Notifications',
                  icon: CupertinoIcons.bell_solid,
                  isSelected: (selectedIndex == 1),
                  onTap: itemSelected),
              _NavigationBarItem(
                  index: 2,
                  label: 'Contacts',
                  icon: CupertinoIcons.person_2_fill,
                  isSelected: (selectedIndex == 2),
                  onTap: itemSelected),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {super.key,
      required this.index,
      required this.label,
      required this.icon,
      required this.isSelected,
      required this.onTap});

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary)
                  : const TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
