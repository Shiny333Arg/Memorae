import 'package:flutter/material.dart';

// Colores centralizados
const kBgColor = Color(0xFF525252);
const kAppBarColor = Color(0xFF383838);
const kAppBarText = Color(0xFFFFFFFF);

const kSwitchActive = Color(0xFF1E3A8A);
const kSwitchThumbInactive = Color(0xFFDDE3F1);
const kSwitchTrackInactive = Color(0xFF3B4148);

const kFieldFill = Color(0xFFE9EEF5); // fondo clarito

// Espaciados / estilos
const kListPadding = EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
const kCardRadius = 12.0;

// Tema de la app
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.white, // respetando tu configuración
  scaffoldBackgroundColor: kBgColor,

  // estilos de app bar
  appBarTheme: const AppBarTheme(
    backgroundColor: kAppBarColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: kAppBarText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: kAppBarText),
  ),


  // estilos de alertas
  cardTheme: const CardThemeData(
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(kCardRadius)),
    ),
    margin: EdgeInsets.zero,
  ),

  // estilos de campos
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kFieldFill,
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kCardRadius),
      borderSide: BorderSide.none, // sin borde visible
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kCardRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kCardRadius),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.black54),
    labelStyle: const TextStyle(color: Colors.black87),
  ),

  // botón cancelar
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,         // texto en blanco
      side: const BorderSide(color: Colors.white), // borde blanco
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),

  // botón guardar
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Colors.white,         // fondo blanco
      foregroundColor: Colors.black,         // texto en negro
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),

);
