class MyFormInputGroupModel {
  final String name;
  final String? label;
  final String? description;
  final List<Map<String, dynamic>> inputs;
  final bool isDisabled;

  MyFormInputGroupModel({
    required this.name,
    this.label = "",
    this.description = "",
    this.inputs = const [],
    this.isDisabled = false,
  });
}

// options:

// validationRules: