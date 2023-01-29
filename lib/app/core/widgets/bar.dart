import 'package:flutter/material.dart';

class Bar extends StatefulWidget {
  const Bar({Key? key}) : super(key: key);

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _selectedIndex == 0
              ? const Icon(Icons.dashboard_rounded)
              : const Icon(Icons.dashboard_outlined),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 1
              ? const Icon(Icons.add_circle_rounded)
              : const Icon(Icons.add_circle_outline_outlined),
          label: 'Adicionar Tarefa',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 2
              ? const Icon(Icons.timer_rounded)
              : const Icon(Icons.timer_outlined),
          label: 'Todas as Tarefas',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
