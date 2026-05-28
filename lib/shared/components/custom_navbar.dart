import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback? onChatPressed;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 20.0),
      child: Row(
        children: [
          // Cápsula de Navegación Principal (M3 Primary Container)
          Expanded(
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary, // 🎨 Color principal del tema
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(theme, icon: Icons.home, index: 0),
                  _buildNavItem(theme, icon: Icons.history, index: 1),
                  _buildNavItem(theme, icon: Icons.description, index: 2),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Botón Flotante de Chat Independiente (M3 Inverse Surface / Negro)
          GestureDetector(
            onTap: onChatPressed,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: theme.colorScheme.inverseSurface, // 🎨 Color oscuro de contraste en M3
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chat_bubble, 
                color: theme.colorScheme.onInverseSurface, 
                size: 24
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(ThemeData theme, {required IconData icon, required int index}) {
    final isSelected = currentIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected 
            ? theme.colorScheme.onPrimary 
            : theme.colorScheme.onPrimary.withOpacity(0.5), // 
        size: 28,
      ),
      onPressed: () => onTabSelected(index),
    );
  }
}