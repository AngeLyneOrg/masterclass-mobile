import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:masterclass/features/auth/presentation/providers/auth_provider.dart';
import 'package:masterclass/features/auth/presentation/widgets/auth_text_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey      = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl    = TextEditingController();
  final _passCtrl     = TextEditingController();

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(authProvider).register(
      username: _usernameCtrl.text.trim(),
      email:    _emailCtrl.text.trim(),
      password: _passCtrl.text.trim(),
    );
    if (mounted && ref.read(authProvider).status ==
        AuthStatus.unauthenticated) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs       = Theme.of(context).colorScheme;
    final tt       = Theme.of(context).textTheme;
    final provider = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),

                // Header
                Text('Create account', style: tt.headlineLarge),
                const SizedBox(height: 8),
                Text(
                  'Start your learning journey',
                  style: tt.bodyLarge?.copyWith(color: cs.outline),
                ),
                const SizedBox(height: 48),

                // Fields
                AuthTextField(
                  label:      'Username',
                  hint:       'johndoe',
                  controller: _usernameCtrl,
                  prefixIcon: Icons.person_outlined,
                  validator: (v) =>
                  v!.length >= 3 ? null : 'Minimum 3 characters',
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  label:        'Email',
                  hint:         'you@example.com',
                  controller:   _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon:   Icons.email_outlined,
                  validator: (v) =>
                  v!.contains('@') ? null : 'Enter a valid email',
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  label:      'Password',
                  hint:       '••••••••',
                  controller: _passCtrl,
                  isPassword: true,
                  prefixIcon: Icons.lock_outlined,
                  validator: (v) =>
                  v!.length >= 6 ? null : 'Minimum 6 characters',
                ),

                const SizedBox(height: 12),

                // Error
                if (provider.status == AuthStatus.error)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cs.errorContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      provider.errorMessage ?? '',
                      style: tt.bodySmall?.copyWith(
                        color: cs.onErrorContainer,
                      ),
                    ),
                  ),

                const SizedBox(height: 24),

                // Submit
                ElevatedButton(
                  onPressed: provider.status == AuthStatus.loading
                      ? null
                      : _submit,
                  child: provider.status == AuthStatus.loading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Text('Create account'),
                ),
                const SizedBox(height: 24),

                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: tt.bodyMedium?.copyWith(color: cs.outline),
                    ),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}