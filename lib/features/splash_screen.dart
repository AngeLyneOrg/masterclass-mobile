import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 1. Initialisation du contrôleur d'animation (ici réglé sur 3 secondes)
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // 2. Définition de la progression de 0.0 (0%) à 1.0 (100%)
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        // Force le widget à se redessiner à chaque étape de l'animation
        setState(() {});
      })
      ..addStatusListener((status) {
        // 3. Quand l'animation est terminée (AnimationStatus.completed), on change de page
        if (status == AnimationStatus.completed) {
          context.go('home');
        }
      });

    // 4. Lancement de l'animation
    _animationController.forward();
  }

  @override void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. L'image de fond qui prend tout l'écran
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_students.png',
              // Remplacez par votre image
              fit: BoxFit.cover,
            ),
          ),

          // 2. Le filtre violet transparent (Color Blend)
          Positioned.fill(
            child: Container(
              color: Color(
                0xFF003BFF,
              ).withOpacity(0.75), // Ajustez l'opacité selon vos besoins
            ),
          ),

          // 3. Le contenu de la page
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo central (icône chapeau de diplôme)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/icons/masterclass_white.png",
                            height: 120,
                            width: 120,
                          ),
                          Text(
                            'ONLINE LEARNING',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              letterSpacing: 2,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Titre Principal
                    const Text(
                      'MasterClass',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Boostez vos compétences quotidiennes grâce à un apprentissage sur mesure guidé par l\'intelligence artificielle.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          height: 1.4, // Améliore l'interligne
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Les 3 icônes horizontales (Cours, Succès, Objectif)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildFeatureIcon(Icons.book, 'Cours'),
                        _buildFeatureIcon(Icons.emoji_events, 'Succès'),
                        _buildFeatureIcon(Icons.track_changes, 'Objectif'),
                      ],
                    ),
                    const SizedBox(height: 50),

                    // Barre de progression (Chargement)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: _animation.value, // Progression actuelle (0.0 à 1.0)
                          backgroundColor: Colors.white30,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          minHeight: 8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Texte "CHARGEMENT..."
                    Text(
                      'CHARGEMENT...',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget réutilisable pour les 3 icônes du bas
  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, size: 35, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
