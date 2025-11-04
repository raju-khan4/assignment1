import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = []; // Store all student records
  Set<String> ids = {}; // To keep IDs unique

  print("=== Student Record Management System ===");

  while (true) {
    stdout.write("\nEnter Student ID (or type 'done' to finish): ");
    String id = stdin.readLineSync()!.trim();

    if (id.toLowerCase() == 'done') break;

    if (ids.contains(id)) {
      print("  This ID already exists! Please enter a unique one.");
      continue;
    }

    stdout.write("Enter Student Name: ");
    String name = stdin.readLineSync()!.trim();

    stdout.write("Enter Student Score (0–100): ");
    double score = double.parse(stdin.readLineSync()!);

    // Determine grade
    String grade = getGrade(score);

    // Store student record
    students.add({'ID': id, 'Name': name, 'Score': score, 'Grade': grade});
    ids.add(id);

    print(" Student record added successfully!");
  }

  print("\n=== Result Summary ===");

  if (students.isEmpty) {
    print("No student data entered.");
    return;
  }

  // Sort by score (descending)
  students.sort((a, b) => b['Score'].compareTo(a['Score']));

  // Display sorted list
  print("\nSorted List (by Score - Descending):");
  print("-------------------------------------");
  for (var s in students) {
    print("ID: ${s['ID']}, Name: ${s['Name']}, Score: ${s['Score']}, Grade: ${s['Grade']}");
  }

  // Summary details
  double highest = students.first['Score'];
  double lowest = students.last['Score'];

  print("\nTotal Students: ${students.length}");
  print("Highest Score: $highest");
  print("Lowest Score: $lowest");

  print("\n=== Program Ended ===");
}

// Function to determine grade
String getGrade(double score) {
  if (score >= 80) return 'A+';
  else if (score >= 70) return 'A';
  else if (score >= 60) return 'A-';
  else if (score >= 50) return 'B';
  else if (score >= 40) return 'C';
  else if (score >= 33) return 'D';
  else return 'F';
}
