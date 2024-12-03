import 'package:flutter/material.dart';
import 'pages/vital_signs_page.dart';
import 'pages/medication_page.dart';
import 'pages/emergency_page.dart';
import 'pages/settings_page.dart';


void main() {
  runApp(TopyWearApp());
}

class TopyWearApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOPY Wear OS',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          background: Colors.black,
          onPrimary: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white70),
        ),
      ),
      home: WearHomePage(),
    );
  }
}

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
              MaterialPageRoute(builder: (context) => VitalSignsPage()),
            ),
          ),
          _buildAnimatedMenuCard(
            context,
            icon: Icons.medical_services,
            title: 'Medicamentos',
            color: Colors.green,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedicationPage()),
            ),
          ),
          _buildAnimatedMenuCard(
            context,
            icon: Icons.warning,
            title: 'Emergencias',
            color: Colors.orange,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmergencyPage()),
            ),
          ),
          _buildAnimatedMenuCard(
            context,
            icon: Icons.settings,
            title: 'Configuración',
            color: Colors.grey,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
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
          ],
        ),
      ),
    );
  }
}

class VitalSignsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signos Vitales'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tus Signos Vitales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _buildVitalSignCard('Frecuencia Cardíaca', '78 bpm', Icons.favorite, Colors.red),
            _buildVitalSignCard('Presión Arterial', '120/80 mmHg', Icons.bloodtype, Colors.blueAccent),
            _buildVitalSignCard('Oxígeno en Sangre', '98%', Icons.water_drop, Colors.green),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Construye una tarjeta para mostrar un signo vital
  Widget _buildVitalSignCard(String title, String value, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 28),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(value, style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}

class MedicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recordatorios de Medicamentos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _buildMedicationReminder('Paracetamol', '8:00 AM', Icons.medical_services, Colors.green),
            _buildMedicationReminder('Ibuprofeno', '2:00 PM', Icons.medical_services, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationReminder(String name, String time, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 28),
        title: Text(name, style: TextStyle(color: Colors.white)),
        subtitle: Text('Hora: $time', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergencias'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Simula el envío de una alerta de emergencia
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Alerta de emergencia enviada'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text(
              'Enviar Alerta',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opciones de Configuración',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _buildSwitchOption('Modo Oscuro', true),
            _buildSwitchOption('Notificaciones', false),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchOption(String title, bool value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SwitchListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        value: value,
        onChanged: (bool newValue) {},
        activeColor: Colors.blueAccent,
      ),
    );
  }
}
