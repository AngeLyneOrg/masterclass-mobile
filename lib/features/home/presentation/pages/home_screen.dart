import 'package:flutter/material.dart';
import 'package:masterclass/core/themes/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Lire le thème actuel ─────────────────────────────────
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final controller = ThemeController.of(context);
    final isDark = controller.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text('MasterClass', style: tt.titleLarge),
        actions: [
          // ── Bouton toggle thème ──────────────────────────
          IconButton(
            onPressed: controller.toggleTheme,
            tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                key: ValueKey(isDark),
                color: cs.onSurface,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Carte de bienvenue ───────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cs.primaryContainer,          // couleur du thème
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bonjour 👋',
                    style: tt.headlineSmall?.copyWith(
                      color: cs.onPrimaryContainer,  // texte sur primaryContainer
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Prêt à apprendre aujourd\'hui ?',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onPrimaryContainer.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Section titre ────────────────────────────────
            Text('Continuer', style: tt.titleMedium),
            const SizedBox(height: 12),

            // ── Exemple de card cours ────────────────────────
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: cs.secondaryContainer,
                  child: Icon(
                    Icons.play_circle_outline,
                    color: cs.onSecondaryContainer,
                  ),
                ),
                title: Text('Introduction à Flutter', style: tt.titleSmall),
                subtitle: Text(
                  '3 modules restants',
                  style: tt.bodySmall?.copyWith(color: cs.outline),
                ),
                trailing: Icon(Icons.chevron_right, color: cs.outline),
              ),
            ),

            const SizedBox(height: 24),
            Text('Thème actuel', style: tt.titleMedium),
            const SizedBox(height: 12),

            // ── Affichage du mode actuel ─────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: cs.outlineVariant),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                    color: cs.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    isDark ? 'Mode sombre actif' : 'Mode clair actif',
                    style: tt.bodyMedium?.copyWith(color: cs.onSurface),
                  ),
                  const Spacer(),
                  Switch(
                    value: isDark,
                    onChanged: (_) => controller.toggleTheme(),
                    activeColor: cs.primary,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              child: Text("Hello World!"),
              onPressed: () => {
                print("Hello World!")
              },
            ),

            Divider(),

            const SizedBox(height: 12),
            OutlinedButton(
              child: Text("Hello World!"),
              onPressed: () => {
                print("Hello World!")
              },
            ),

          ],
        ),
      ),
    );
  }
}