import 'package:flutter/material.dart';
import '../utils/constants.dart';

class MedicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.medicationTitle),
        backgroundColor: AppColors.medication,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recordatorios de Medicamentos',
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMedicationItem(
                    context,
                    medicationName: 'Paracetamol',
                    dosage: '500mg',
                    time: '08:00 AM',
                  ),
                  _buildMedicationItem(
                    context,
                    medicationName: 'Ibuprofeno',
                    dosage: '200mg',
                    time: '12:00 PM',
                  ),
                  _buildMedicationItem(
                    context,
                    medicationName: 'Omeprazol',
                    dosage: '20mg',
                    time: '08:00 PM',
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción para agregar un nuevo recordatorio
                _addNewMedication();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Función de agregar medicamento en desarrollo'),
                    backgroundColor: AppColors.medication,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.medication,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
              ),
              child: Text(
                'Agregar Medicamento',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Método para construir un elemento de medicamento
  Widget _buildMedicationItem(
      BuildContext context, {
        required String medicationName,
        required String dosage,
        required String time,
      }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.medical_services, color: AppColors.medication),
        title: Text(
          medicationName,
          style: AppTextStyles.cardTitle,
        ),
        subtitle: Text(
          '$dosage - $time',
          style: TextStyle(color: AppColors.textWhite, fontSize: 14),
        ),
      ),
    );
  }

  /// Simula agregar un nuevo medicamento
  void _addNewMedication() {
    // Aquí puedes implementar la funcionalidad para agregar medicamentos
    print('Agregar nuevo medicamento');
  }
}
