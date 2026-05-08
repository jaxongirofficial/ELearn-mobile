import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/profile_detail_scaffold.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  var _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return ProfileDetailScaffold(
      title: 'Language',
      children: [
        _LanguageOption(
          flag: '🇬🇧',
          title: 'English',
          selected: _selectedLanguage == 'English',
          onTap: () => setState(() => _selectedLanguage = 'English'),
        ),
        _LanguageOption(
          flag: '🇺🇿',
          title: 'O‘zbek',
          selected: _selectedLanguage == 'Uzbek',
          onTap: () => setState(() => _selectedLanguage = 'Uzbek'),
        ),
        _LanguageOption(
          flag: '🇷🇺',
          title: 'Русский',
          selected: _selectedLanguage == 'Russian',
          onTap: () => setState(() => _selectedLanguage = 'Russian'),
        ),
      ],
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.flag,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String flag;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: selected
            ? AppColors.primary.withOpacity(0.14)
            : colors.subjectCardBackground,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: selected
                    ? theme.colorScheme.primary
                    : colors.subjectCardBorder,
                width: selected ? 1.4 : 1,
              ),
            ),
            child: Row(
              children: [
                Text(flag, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colors.subjectCardTitle,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 160),
                  child: selected
                      ? Icon(
                          Icons.check_circle_rounded,
                          key: const ValueKey('selected'),
                          color: theme.colorScheme.primary,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          key: const ValueKey('unselected'),
                          color: colors.subjectCardDescription,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
