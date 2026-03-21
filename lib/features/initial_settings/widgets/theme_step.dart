import 'package:flutter/material.dart';

class ThemeStep extends StatelessWidget {
  final ThemeMode selectedTheme;
  final ValueChanged<ThemeMode> onThemeSelected;

  const ThemeStep({
    super.key,
    required this.selectedTheme,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _ThemeCard(
            title: 'Claro',
            icon: Icons.light_mode,
            isSelected: selectedTheme == ThemeMode.light,
            onTap: () => onThemeSelected(ThemeMode.light),
            child: const _LightPreview(),
          ),
          const SizedBox(height: 14),
          _ThemeCard(
            title: 'Escuro',
            icon: Icons.nightlight_round,
            isSelected: selectedTheme == ThemeMode.dark,
            onTap: () => onThemeSelected(ThemeMode.dark),
            child: const _DarkPreview(),
          ),
          const SizedBox(height: 14),
          _ThemeCard(
            title: 'Sistema',
            icon: Icons.settings_suggest_rounded,
            isSelected: selectedTheme == ThemeMode.system,
            tag: 'Padrão',
            onTap: () => onThemeSelected(ThemeMode.system),
            child: const _SystemPreview(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final String? tag;
  final VoidCallback onTap;
  final Widget child;

  const _ThemeCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.child,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: const Color(0xFF141821),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected ? const Color(0xFF9AAFFF) : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? const Color(0x222F53FF)
                : const Color(0x12000000),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(icon, size: 15, color: const Color(0xFFC7D1FF)),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFFF0F2F8),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    if (tag != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2347D7),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          tag!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LightPreview extends StatelessWidget {
  const _LightPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F4),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE3E3E6),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7E7EA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFDADADF),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

class _DarkPreview extends StatelessWidget {
  const _DarkPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF181B22),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF3B3F49),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2E37),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF242833),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF343844),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}


class _SystemPreview extends StatelessWidget {
  const _SystemPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D25),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFFF1F1F2),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    height: 7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9DD),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF181B22),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    height: 7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF343844),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2E37),
                      borderRadius: BorderRadius.circular(4),
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