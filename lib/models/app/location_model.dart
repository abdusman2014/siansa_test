/*

To design a **`Locations`** model that supports multiple use cases — such as storing locations for a given company client or external locations for equipment — the model should be flexible enough to distinguish between **company-owned locations** and **external locations**. Below is a comprehensive design:

---

### **Locations Model Design**

#### **1. Core Fields**
These fields define the essential details of any location:
- **`id`**: Unique identifier for the location (e.g., UUID).
- **`name`**: The name of the location (e.g., “Headquarters,” “Warehouse A,” “Construction Site X”).
- **`type`**: Type of location, such as:
  - **`company_client`**: A company-owned location.
  - **`external`**: An external or independent location.
- **`description`**: Additional details about the location (e.g., “Temporary storage,” “Primary office”).
- **`coordinates`**: Geolocation of the location:
  - **`latitude`**
  - **`longitude`**

---

#### **2. Company Association**
These fields link the location to a company (if applicable):
- **`companyId`**: The ID of the company this location belongs to (nullable for external locations).
- **`companyName`** (optional): Cached name of the company for quick reference (denormalized for convenience).

---

#### **3. Equipment Association**
Fields that link specific equipment to the location:
- **`equipmentIds`**: A list of IDs for the equipment stored at this location (nullable if no equipment is stored).

---

#### **4. Address Information**
For physical addresses, include fields such as:
- **`addressLine1`**: Main address line (e.g., street name and number).
- **`addressLine2`**: Additional address details (e.g., suite or apartment number).
- **`city`**
- **`state`**
- **`postalCode`**
- **`country`**

---

#### **5. Operational Details**
For location-specific operations:
- **`contactPerson`**:
  - **`name`**
  - **`email`**
  - **`phone`**
- **`businessHours`**: Operating hours for the location.
- **`status`**: Active, inactive, or archived.

---

#### **6. Audit Fields**
Track creation and updates for auditing:
- **`createdAt`**: Timestamp of when the location was added.
- **`updatedAt`**: Timestamp of the last update.
- **`createdByUserId`**: ID of the user who created the location.

---

### **Example JSON Representation**
```json
{
  "id": "loc_001",
  "name": "Warehouse A",
  "type": "company_client",
  "description": "Primary warehouse for northern region operations.",
  "coordinates": {
    "latitude": 37.7749,
    "longitude": -122.4194
  },
  "companyId": "comp_123",
  "companyName": "Tech Innovations Inc.",
  "equipmentIds": ["eq_001", "eq_002", "eq_003"],
  "address": {
    "addressLine1": "123 Warehouse Lane",
    "addressLine2": "Building B",
    "city": "San Francisco",
    "state": "California",
    "postalCode": "94103",
    "country": "USA"
  },
  "contactPerson": {
    "name": "John Doe",
    "email": "john.doe@techinnovations.com",
    "phone": "+1234567890"
  },
  "businessHours": "Mon-Fri 8 AM to 6 PM",
  "status": "Active",
  "createdAt": "2024-12-10T10:00:00Z",
  "updatedAt": "2024-12-11T12:00:00Z",
  "createdByUserId": "user_123"
}
```

---

### **Use Cases**

#### **1. Company Client Locations**
For company-owned locations:
- **`type`**: `company_client`
- **`companyId`**: The ID of the client company owning the location.
- **`equipmentIds`**: List of equipment currently at this location (if applicable).

#### **2. External Locations**
For independent or temporary locations:
- **`type`**: `external`
- **`companyId`**: `null`
- **`equipmentIds`**: List of equipment IDs currently at this location.

---

### **Additional Considerations**

1. **Flexibility**:
   - Use the `type` field to distinguish between company and external locations.
   - Allow `companyId` to be nullable to support external locations.

2. **Geolocation Support**:
   - Use **`coordinates`** (latitude/longitude) to support mapping features or distance calculations.

3. **Equipment Management**:
   - Store equipment IDs as a list in `equipmentIds` to easily track what equipment is stored at a location.

4. **Performance**:
   - Index fields like `companyId` and `type` for efficient queries when filtering by company or location type.

5. **Validation**:
   - Ensure that **address fields** and **coordinates** are consistent (e.g., a location cannot have both empty coordinates and address fields).

---

By following this design, you can effectively manage both company-related and external locations while supporting future scalability and features.

*/