import 'dart:io';

String fmt(double v) => v.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');

void main() {
  while (true) {
    print("====================================");
    print("       SMART TEMPERATURE CONVERTER");
    print("====================================");
    print("1. Celsius to Fahrenheit");
    print("2. Fahrenheit to Celsius");
    print("3. Celsius to Kelvin");
    print("4. Kelvin to Celsius");
    print("5. Fahrenheit to Kelvin");
    print("6. Kelvin to Fahrenheit");
    print("7. Exit");
    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync() ?? "";

    if (choice == "7") {
      print("\n====================================");
      print("          Thank You!");
      print("          Program Ended");
      print("====================================");
      break;
    }

    if (choice != "1" &&
        choice != "2" &&
        choice != "3" &&
        choice != "4" &&
        choice != "5" &&
        choice != "6") {
      print("Invalid choice! Please try again.\n");
      continue;
    }

    String unit = (choice == "2" || choice == "5")
        ? "Fahrenheit"
        : (choice == "4" || choice == "6")
        ? "Kelvin"
        : "Celsius";

    stdout.write("Enter temperature in $unit: ");
    String input = stdin.readLineSync() ?? "";
    double? temperature = double.tryParse(input);

    if (temperature == null) {
      print("Invalid temperature! Please enter a number.\n");
      continue;
    }

    if ((choice == "4" || choice == "6") && temperature < 0) {
      print("Invalid temperature! Kelvin cannot be below 0.\n");
      continue;
    }

    double result;
    switch (choice) {
      case "1":
        result = (temperature * 9 / 5) + 32;
        print("${fmt(temperature)}°C = ${fmt(result)}°F");
        break;
      case "2":
        result = (temperature - 32) * 5 / 9;
        print("${fmt(temperature)}°F = ${fmt(result)}°C");
        break;
      case "3":
        result = temperature + 273.15;
        print("${fmt(temperature)}°C = ${fmt(result)} K");
        break;
      case "4":
        result = temperature - 273.15;
        print("${fmt(temperature)} K = ${fmt(result)}°C");
        break;
      case "5":
        result = (temperature - 32) * 5 / 9 + 273.15;
        print("${fmt(temperature)}°F = ${fmt(result)} K");
        break;
      case "6":
        result = (temperature - 273.15) * 9 / 5 + 32;
        print("${fmt(temperature)} K = ${fmt(result)}°F");
        break;
    }

    stdout.write("\nDo you want to perform another conversion? (y/n): ");
    String again = stdin.readLineSync() ?? "n";
    if (again.toLowerCase() != "y") {
      print("\n====================================");
      print("          Thank You!");
      print("          Program Ended");
      print("====================================");
      break;
    }
    print("");
  }
}