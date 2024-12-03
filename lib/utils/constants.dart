import 'package:flutter/material.dart';

/// Colores principales utilizados en la aplicación Wear OS
class AppColors {
  static const Color background = Colors.black;
  static const Color primary = Colors.blueAccent;
  static const Color vitalSigns = Colors.redAccent;
  static const Color medication = Colors.greenAccent;
  static const Color emergency = Colors.orangeAccent;
  static const Color settings = Colors.grey;
  static const Color textWhite = Colors.white;
}

/// Textos de la aplicación
class AppStrings {
  static const String appTitle = 'TOPY - Wear OS';
  static const String homeTitle = 'Bienvenido a TOPY';
  static const String vitalSignsTitle = 'Signos Vitales';
  static const String medicationTitle = 'Medicamentos';
  static const String emergencyTitle = 'Emergencias';
  static const String settingsTitle = 'Configuración';
  static const String vitalSignsPlaceholder = 'Aquí se mostrarán los signos vitales.';
  static const String medicationPlaceholder = 'Aquí se mostrarán los recordatorios de medicamentos.';
  static const String emergencyPlaceholder = 'Aquí puedes activar una alerta de emergencia.';
  static const String settingsPlaceholder = 'Opciones de configuración del reloj.';
}

/// Iconos de las categorías
class AppIcons {
  static const IconData vitalSigns = Icons.favorite;
  static const IconData medication = Icons.medical_services;
  static const IconData emergency = Icons.warning;
  static const IconData settings = Icons.settings;
}

/// Estilo de texto reutilizable
class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  static const TextStyle placeholder = TextStyle(
    fontSize: 18.0,
    color: AppColors.textWhite,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );
}
