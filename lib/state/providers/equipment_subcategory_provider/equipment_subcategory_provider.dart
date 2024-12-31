import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/equipment_subcategory_model.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/subproviders/equipment_subcategory_crud_provider.dart';
import 'package:siansa_app/state/providers/equipment_subcategory_provider/subproviders/equipment_subcategory_pagination_provider.dart';

class EquipmentSubcategoryProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final EquipmentSubcategoryCRUDProvider _crudProvider;
  late final EquipmentSubcategoryPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = EquipmentSubcategoryCRUDProvider(this);
    _paginationProvider = EquipmentSubcategoryPaginationProvider(this);
  }

  // sub providers access

  EquipmentSubcategoryCRUDProvider get crud => _crudProvider;
  EquipmentSubcategoryPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  EquipmentSubcategoryModel? _equipmentSubcategory; // Private user model

  // Getters
  // --------------------------------------------------

  EquipmentSubcategoryModel? get equipmentSubcategory => _equipmentSubcategory;

  // Setters
  // --------------------------------------------------

  void setEquipmentSubcategory(
      EquipmentSubcategoryModel? equipmentSubcategory) {
    _equipmentSubcategory = equipmentSubcategory;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearEquipmentSubcategory() {
    setEquipmentSubcategory(null);
  }

  void setEquipmentSubcategoryFields(Map<String, dynamic> fields) {
    if (_equipmentSubcategory != null) {
      fields.forEach((field, value) {
        if (_equipmentSubcategory!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _equipmentSubcategory!.toJson()[field] = value;
        } else {
          // print('Error: Field $field does not exist in user role object.');
        }
      });

      notifyListeners(); // Notify listeners after the fields update
    } else {
      // print('Error: No user role object found to update.');
    }
  }

  // **************************************************
  // Constructor (If needed / Loads initial data)
  // **************************************************

  EquipmentSubcategoryProvider() {
    _initializeSubProviders();
  }

  // **************************************************
  // Dispose method
  // **************************************************

  @override
  void dispose() {
    super.dispose();
  }

  // **************************************************
  // Private Methods/Helpers (if necessary)
  // **************************************************

  // **************************************************
  // Public Methods (to manipulate data/state)
  // **************************************************

  // You can add additional methods here that might coordinate actions
  // between the auth and profile providers if necessary.

  // **************************************************
  // **************************************************
}
