class ListConversionsUtilities {
  // /// A generic function to convert a list of objects into a list of maps.
  // ///
  // /// - `sourceList`: The list of objects to convert.
  // /// - `fieldMapping`: A map specifying the mapping between the source object's fields
  // ///   and the desired key names in the resulting map.
  // ///   Example: `{ 'name': 'text', 'id': 'value' }`
  // ///
  // /// The function uses the field names in `fieldMapping` to extract the data
  // /// from the objects in the list and creates a list of maps.
  // static List<Map<String, dynamic>> convertTypedListToMappedList<T>(
  //   List<T> sourceList,
  //   Map<String, String> fieldMapping,
  // ) {
  //   // Transform the source list into a list of maps using `map` and `forEach`.
  //   return sourceList.map((item) {
  //     final Map<String, dynamic> mappedItem = {};

  //     // Iterate over each field mapping to extract and map values.
  //     fieldMapping.forEach((sourceField, targetKey) {
  //       // Use reflection to dynamically access the field of the object.
  //       final value = item.toJson()[
  //           sourceField]; // Assuming each model has a `toJson()` method.
  //       mappedItem[targetKey] = value;
  //     });

  //     return mappedItem;
  //   }).toList();
  // }

  /// A generic function to convert a list of objects into a list of maps.
  ///
  /// - `sourceList`: The list of objects to convert.
  /// - `fieldMapping`: A map where the keys are the desired new map keys
  ///   (e.g., 'text', 'value'), and the values are functions to extract the
  ///   corresponding data from the objects.
  ///   Example: `{ 'text': (item) => item.name, 'value': (item) => item.id }`
  ///
  /// This function uses the provided getter functions in `fieldMapping` to extract
  /// and map the desired fields from the objects.
  static List<Map<String, dynamic>> convertTypedListToMappedList<T>(
    List<T> sourceList,
    Map<String, dynamic Function(T)> fieldMapping,
  ) {
    return sourceList.map((item) {
      final Map<String, dynamic> mappedItem = {};

      // Iterate through the field mapping to create the map structure.
      fieldMapping.forEach((targetKey, getterFunction) {
        mappedItem[targetKey] = getterFunction(item);
      });

      return mappedItem;
    }).toList();
  }
}
