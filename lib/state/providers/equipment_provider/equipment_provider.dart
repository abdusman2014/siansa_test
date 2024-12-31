import 'package:flutter/foundation.dart';
import 'package:siansa_app/models/app/equipment_model.dart';
import 'package:siansa_app/state/providers/equipment_provider/subproviders/equipment_crud_provider.dart';
import 'package:siansa_app/state/providers/equipment_provider/subproviders/equipment_pagination_provider.dart';

class EquipmentProvider with ChangeNotifier {
  // **************************************************
  // Import and init sub providers (they access this class)
  // **************************************************

  late final EquipmentCRUDProvider _crudProvider;
  late final EquipmentPaginationProvider _paginationProvider;

  void _initializeSubProviders() {
    _crudProvider = EquipmentCRUDProvider(this);
    _paginationProvider = EquipmentPaginationProvider(this);
  }

  // sub providers access

  EquipmentCRUDProvider get crud => _crudProvider;
  EquipmentPaginationProvider get pagination => _paginationProvider;

  // **************************************************
  // Fields/Properties (private and public)
  // **************************************************

  EquipmentModel? _equipment; // Private user model

  // Getters
  // --------------------------------------------------

  EquipmentModel? get equipment => _equipment;

  // Setters
  // --------------------------------------------------

  void setEquipment(EquipmentModel? equipment) {
    _equipment = equipment;
    notifyListeners(); // Notify listeners when user role is set
  }

  void setClearEquipment() {
    setEquipment(null);
  }

  void setEquipmentFields(Map<String, dynamic> fields) {
    if (_equipment != null) {
      fields.forEach((field, value) {
        if (_equipment!.toJson().containsKey(field)) {
          // Dynamically set the field based on field name
          _equipment!.toJson()[field] = value;
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

  EquipmentProvider() {
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
