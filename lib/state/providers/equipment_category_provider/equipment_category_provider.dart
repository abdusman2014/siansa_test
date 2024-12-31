import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/equipment_category_model.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/subproviders/equipment_category_crud_provider.dart';
import 'package:siansa_app/state/providers/equipment_category_provider/subproviders/equipment_category_pagination_provider.dart';

class EquipmentCategoryProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final EquipmentCategoryCRUDProvider _crudProvider;
  late final EquipmentCategoryPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = EquipmentCategoryCRUDProvider(this);
    _paginationProvider = EquipmentCategoryPaginationProvider(this);
  }

  // sub providers access

  EquipmentCategoryCRUDProvider get crud => _crudProvider;
  EquipmentCategoryPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  EquipmentCategoryModel? _equipmentCategory; // Private user model

  // Getters
  // --------------------------------------------------

  EquipmentCategoryModel? get equipmentCategory => _equipmentCategory;

  // Setters
  // --------------------------------------------------

  void setEquipmentCategory(EquipmentCategoryModel? equipmentCategory) {
    _equipmentCategory = equipmentCategory;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearEquipmentCategory() {
    setEquipmentCategory(null);
  }

  void setEquipmentCategoryFields(Map<String, dynamic> fields) {
    if (_equipmentCategory != null) {
      fields.forEach((field, value) {
        if (_equipmentCategory!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _equipmentCategory!.toJson()[field] = value;
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

  EquipmentCategoryProvider() {
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
