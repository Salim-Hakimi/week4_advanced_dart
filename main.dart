
void main() {
  // ==========================================
  // LAB 1: SPREAD & COLLECTIONS
  // ==========================================

  print("\n========== LAB 1: SPREAD & COLLECTIONS ==========");

  List<String> topics1 = ["Dart", "Flutter", "Widgets"];
  List<String> topics2 = ["StatefulWidget", "StatelessWidget", "Navigation"];

  // Spread operator
  List<String> allTopics = [...topics1, ...topics2];
  print("Combined Topics: $allTopics");

  // Nullable List and null-aware spread
  List<String>? optionalTopics;
  List<String> safeTopics = [
    "Programming",
    ...?optionalTopics,
  ];
  print("Safe Topics: $safeTopics");

  // Collection-if
  bool isAdmin = true;

  List<String> menu = [
    "Home",
    "Profile",
    if (isAdmin) "Admin Dashboard",
  ];
  print("Menu: $menu");

  // Collection-for
  List<String> formattedLabels = [
    for (String topic in allTopics) "Topic: $topic"
  ];
  print("Formatted Labels: $formattedLabels");

  // ==========================================
  // LAB 2: MAP
  // ==========================================

  print("\n========== LAB 2: MAP ==========");

  Map<String, dynamic> studentData = {
    "name": "Ahmad",
    "id": 101,
    "semester": 5,
    "department": "Computer Science",
    "address": {
      "city": "Kabul",
      "country": "Afghanistan",
    }
  };

  // Read values
  print("Name: ${studentData["name"]}");

  // Update values
  studentData["semester"] = 6;

  // Add a new key
  studentData["gpa"] = 3.65;

  // Remove a key
  studentData.remove("gpa");

  // Iterate over entries
  studentData.forEach((key, value) {
    print("$key: $value");
  });

  // Read nested Map
  Map<String, dynamic> address = studentData["address"];
  print("City: ${address["city"]}");

  // Convert Map to Student object
  Student student = Student.fromMap(studentData);
  student.displayInfo();

  // ==========================================
  // LAB 3: FUNCTIONS
  // ==========================================

  print("\n========== LAB 3: FUNCTIONS ==========");

  // Normal function
  int add(int a, int b) {
    return a + b;
  }

  print("Addition: ${add(10, 20)}");

  // Fat-arrow function
  int multiply(int a, int b) => a * b;

  print("Multiplication: ${multiply(5, 4)}");

  // Function assigned to a variable
  int Function(int, int) operation = add;
  print("Function variable: ${operation(8, 2)}");

  // Passing function to another function
  void calculate(int a, int b, int Function(int, int) function) {
    print("Calculation result: ${function(a, b)}");
  }

  calculate(10, 5, add);

  // Anonymous function
  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.forEach((number) {
    print("Number: $number");
  });

  // map() transformation
  List<int> doubledNumbers = numbers.map((n) => n * 2).toList();
  print("Doubled Numbers: $doubledNumbers");

  // Flutter button callback examples
  // Named callback: onPressed: showMessage
  // Anonymous callback: onPressed: () { print("Button clicked"); }

  // ==========================================
  // LAB 4: PARAMETERS & CONSTRUCTORS
  // ==========================================

  print("\n========== LAB 4: PARAMETERS & CONSTRUCTORS ==========");

  Product product1 = Product(
    name: "Laptop",
    price: 800,
    category: "Electronics",
  );

  Product product2 = Product.free(
    name: "Dart Course",
  );

  product1.displayInfo();
  product2.displayInfo();

  // ==========================================
  // LAB 5: PRIVATE MEMBERS & MIXINS
  // ==========================================

  print("\n========== LAB 5: PRIVATE MEMBERS & MIXINS ==========");

  BankAccount account = BankAccount(500);

  print("Initial Balance: ${account.balance}");

  account.deposit(200);
  account.deposit(-50);

  print("Final Balance: ${account.balance}");
}

// ==========================================
// STUDENT CLASS
// ==========================================

class Student {
  String name;
  int id;
  int semester;
  String department;
  Map<String, dynamic> address;

  Student({
    required this.name,
    required this.id,
    required this.semester,
    required this.department,
    required this.address,
  });

  // Named constructor
  Student.fromMap(Map<String, dynamic> data)
      : name = data["name"],
        id = data["id"],
        semester = data["semester"],
        department = data["department"],
        address = Map<String, dynamic>.from(data["address"]);

  void displayInfo() {
    print("Student: $name");
    print("ID: $id");
    print("Semester: $semester");
    print("Department: $department");
    print("Address: ${address["city"]}, ${address["country"]}");
  }
}

// ==========================================
// PRODUCT CLASS
// ==========================================

class Product {
  final String name;
  final double price;
  final String category;
  final bool available;

  // Named parameters and default value
  Product({
    required this.name,
    required this.price,
    required this.category,
    this.available = true,
  });

  // Named constructor for free products
  Product.free({required this.name})
      : price = 0,
        category = "Free",
        available = true;

  void displayInfo() {
    print("Product: $name");
    print("Price: \$${price}");
    print("Category: $category");
    print("Available: $available");
  }
}

// ==========================================
// LOGGER MIXIN
// ==========================================

mixin Logger {
  void log(String message) {
    print("[LOG]: $message");
  }
}

// ==========================================
// BANK ACCOUNT CLASS
// ==========================================

class BankAccount with Logger {
  double _balance;

  BankAccount(this._balance);

  // Getter
  double get balance => _balance;

  // Deposit method
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      log("Deposited: \$${amount}");
    } else {
      log("Invalid deposit amount!");
    }
  }
}
Column(
  children: [
    Text("Home"),
    Text("Profile"),
    if (isAdmin) Text("Admin Panel"),
    ...courses.map((course) => Text(course)),
  ],
)Map<String, dynamic> student = {
  "name": "Ahmad",
  "age": 22,
  "semester": 5,
};	
