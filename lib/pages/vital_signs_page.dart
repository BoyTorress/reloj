import 'package:flutter/material.dart';

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
            Text(
              'Progreso Diario',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            _buildProgress('Actividad Física', 0.75),
            _buildProgress('Salud Mental', 0.5),
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

  /// Construye una barra de progreso para el progreso diario
  Widget _buildProgress(String title, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[800],
          color: Colors.blueAccent,
          minHeight: 8,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
