import 'package:flutter/material.dart';
import '../../core/widgets/app_background.dart';
import './widgets/theme_step.dart';
import './widgets/notification_step.dart';
import './widgets/message_categories_step.dart';
import './widgets/summary_step.dart';

class InitialSettingsPage extends StatefulWidget {
  const InitialSettingsPage({super.key});

  @override
  State<InitialSettingsPage> createState() => _InitialSettingsPageState();
}

class _InitialSettingsPageState extends State<InitialSettingsPage> {
  final PageController _pageController = PageController();

  int currentStep = 0;
  final int totalSteps = 4;

  ThemeMode selectedTheme = ThemeMode.system;

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() => currentStep++);
      _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishSetup();
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
      _pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void finishSetup() {
    // salvar configurações e navegar
  }

  String getStepTitle() {
    switch (currentStep) {
      case 0:
        return 'Escolha seu tema';
      case 1:
        return 'Configure notificações';
      case 2:
        return 'Categorias de mensagens';
      case 3:
        return 'Resumo final';
      default:
        return '';
    }
  }

  String getStepSubtitle() {
    switch (currentStep) {
      case 0:
        return 'Você pode alterar isso depois nas configurações.';
      case 1:
        return 'Defina como deseja receber seus lembretes.';
      case 2:
        return 'Escolha os tipos de mensagens que mais combinam com você.';
      case 3:
        return 'Confira suas escolhas antes de continuar.';
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InitialSettingsHeader(
                  currentStep: currentStep,
                  totalSteps: totalSteps,
                  onBack: currentStep > 0 ? previousStep : null,
                ),
                const SizedBox(height: 24),
                Text(
                  getStepTitle(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  getStepSubtitle(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB8BCD0),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 28),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ThemeStep(
                        selectedTheme: selectedTheme,
                        onThemeSelected: (theme) {
                          setState(() {
                            selectedTheme = theme;
                          });
                        },
                      ),
                      const NotificationStep(),
                      const MessageCategoriesStep(),
                      SummaryStep(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _BottomNavigationButtons(
                  currentStep: currentStep,
                  totalSteps: totalSteps,
                  onBack: previousStep,
                  onNext: nextStep,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InitialSettingsHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;

  const _InitialSettingsHeader({
    required this.currentStep,
    required this.totalSteps,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBack != null)
          GestureDetector(
            onTap: onBack,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
              color: Colors.white,
            ),
          )
        else
          const SizedBox(width: 18),
        const SizedBox(width: 12),
        const Text(
          'Daily Focus',
          style: TextStyle(
            color: Color(0xFFD9DCEE),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              minHeight: 6,
              value: (currentStep + 1) / totalSteps,
              backgroundColor: const Color(0xFF2A2E45),
              valueColor: const AlwaysStoppedAnimation(Color(0xFFA8B8FF)),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomNavigationButtons extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onBack;
  final VoidCallback onNext;

  const _BottomNavigationButtons({
    required this.currentStep,
    required this.totalSteps,
    required this.onBack,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final isLastStep = currentStep == totalSteps - 1;

    return Row(
      children: [
        if (currentStep > 0)
          Expanded(
            child: OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(54),
                side: const BorderSide(color: Color(0xFF5E668C)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Voltar',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        if (currentStep > 0) const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: Container(
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Color(0xFF9CB0FF), Color(0xFF6D86F8)],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x332D4DFF),
                  blurRadius: 18,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: const Color(0xFF14205B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                isLastStep ? 'Finalizar' : 'Continuar',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
