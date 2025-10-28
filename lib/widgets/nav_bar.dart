import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final void Function(String section) onTap;
  const NavBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<_MenuItem> items = [
      _MenuItem('about', 'About', Icons.person),
      _MenuItem('exp', 'Experience', Icons.badge_outlined),
      _MenuItem('edu', 'Education', Icons.school_outlined),
      _MenuItem('tech', 'Tech Skills', Icons.code_outlined),
      _MenuItem('soft', 'Soft Skills', Icons.handshake_outlined),
      _MenuItem('lang', 'Languages', Icons.language_outlined),
      _MenuItem('proj', 'Projects', Icons.work_outline),
      _MenuItem('course', 'Courses', Icons.menu_book_outlined),
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            final bool compact = constraints.maxWidth < 700;
            final bool showMenu = constraints.maxWidth < 500;

            if (showMenu) {
              return _buildMobileMenu(context, items, compact);
            }

            return _buildHorizontalNavBar(items, compact);
          },
        ),
      ),
    );
  }

  Widget _buildHorizontalNavBar(List<_MenuItem> items, bool compact) {
    final Widget title = Padding(
      padding: EdgeInsets.only(left: compact ? 4 : 8, right: compact ? 12 : 20),
      child: Text(
        'Omayma Portfolio',
        style: TextStyle(
          color: Colors.pinkAccent,
          fontWeight: FontWeight.w700,
          fontSize: compact ? 15 : 18,
          letterSpacing: 0.8,
        ),
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title,
          ...items
              .map(
                (i) => Padding(
                  padding: EdgeInsets.only(right: compact ? 8 : 12),
                  child: _glassButton(
                    label: i.label,
                    icon: i.icon,
                    onTap: () => onTap(i.id),
                    compact: compact,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget _buildMobileMenu(
    BuildContext context,
    List<_MenuItem> items,
    bool compact,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: compact ? 4 : 8,
            right: compact ? 12 : 20,
          ),
          child: Text(
            'Omayma Portfolio',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.w700,
              fontSize: compact ? 15 : 18,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(),
        _glassButton(
          label: 'Menu',
          icon: Icons.menu,
          onTap: () => _showMenuBottomSheet(context, items),
          compact: compact,
        ),
      ],
    );
  }

  void _showMenuBottomSheet(BuildContext context, List<_MenuItem> items) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900]!.withOpacity(0.95),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[500]!,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              ...items
                  .map((item) => _buildMenuListItem(context, item))
                  .toList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuListItem(BuildContext context, _MenuItem item) {
    return ListTile(
      leading: Icon(item.icon, color: Colors.tealAccent, size: 22),
      title: Text(
        item.label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onTap(item.id);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }

  Widget _glassButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required bool compact,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 10 : 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: compact ? 18 : 20, color: Colors.white),
              if (!compact) const SizedBox(width: 6),
              if (!compact)
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper data class
class _MenuItem {
  final String id, label;
  final IconData icon;
  const _MenuItem(this.id, this.label, this.icon);
}
