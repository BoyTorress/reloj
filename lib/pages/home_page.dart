import 'package:flutter/material.dart';
import 'vital_signs_page.dart';
import 'medication_page.dart';
import 'emergency_page.dart';
import 'settings_page.dart';

class WearHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('TOPY - Wear OS'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2, // Dos columnas para una cuadrícula compacta
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildAnimatedMenuCard(
            context,
            icon: Icons.favorite,
            title: 'Signos Vitales',
            color: Colors.red,
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => VitalSignsPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            ),
          ),
          _buildAnimatedMenuCard(
            context,
            icon: Icons.medical_services,
            title: 'Medicamentos',
            color: Colors.green,
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => MedicationPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            ),
          ),
          _buildAnimatedMenuCard(
            context,
            icon: Icons.warning,
            title: 'Emergencias',
            color: Colors.orange,
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => EmergencyPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            ),
          ),
          _buildAnimatedMenuCard(
            context,
            icon: Icons.settings,
            title: 'Configuración',
            color: Colors.grey,
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye una tarjeta animada para el menú principal
  Widget _buildAnimatedMenuCard(BuildContext context,
      {required IconData icon, required String title, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0,
        color: Colors.grey[850],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            if (title == 'Actividad Física') // Progreso diario simulado
              LinearProgressIndicator(
                value: 0.6, // Valor de progreso simulado
                backgroundColor: Colors.grey[700],
                color: Colors.blueAccent,
                minHeight: 8,
              ),
          ],
        ),
      ),
    );
  }
}
