/*

When designing a `Company` model for client companies in your app, it's essential to include fields that meet both the functional requirements of your application and the specific needs of your clients. Below is a **comprehensive list of fields** you may include, categorized by their purpose:

---

### **1. Core Information**
These fields capture basic details about the company:
- **`id`**: A unique identifier for the company (e.g., UUID or auto-incremented ID).
- **`name`**: The name of the company.
- **`legalName`** (optional): The legally registered name, if different from `name`.
- **`registrationNumber`**: Tax ID, company registration number, or equivalent.
- **`industry`**: The industry or business sector the company belongs to.
- **`logo`**: A URL or file path for the company’s logo.
- **`description`**: A short description of the company.

---

### **2. Contact Information**
Fields for communication and location:
- **`email`**: A primary contact email for the company.
- **`phone`**: A primary contact phone number.
- **`website`**: The company’s website URL.
- **`address`**:
  - **`street`**
  - **`city`**
  - **`state`**
  - **`postalCode`**
  - **`country`**
- **`contactPerson`**:
  - **`name`**
  - **`email`**
  - **`phone`**

---

### **3. Operational Details**
Fields that describe the company's internal structure and operations:
- **`employeesCount`**: The number of employees (can be an estimate or range).
- **`locations`**: A list of office or operational locations (optional).
- **`foundedYear`**: The year the company was founded.
- **`businessHours`**: The typical hours of operation.
- **`status`**: Active, inactive, suspended, etc.

---

### **4. Account & Subscription Details**
Fields related to the company's account and app usage:
- **`createdByUserId`**: The ID of the user who created the company in your app.
- **`subscriptionPlan`**: The plan or tier the company is subscribed to (e.g., Free, Pro, Enterprise).
- **`billingInfo`**:
  - **`billingEmail`**
  - **`paymentMethod`** (e.g., Credit Card, PayPal).
- **`createdAt`**: Timestamp when the company was created in your system.
- **`updatedAt`**: Timestamp of the last update.

---

### **5. User Associations**
Fields for linking users to the company:
- **`adminUserIds`**: A list of user IDs that have administrative access to the company account.
- **`memberUserIds`**: A list of user IDs that belong to the company.

---

### **6. Custom Fields**
Include these for flexibility or specific requirements:
- **`tags`**: Keywords or categories associated with the company.
- **`metadata`**: A JSON field for storing additional custom data.

---

### **Example JSON Representation**
```json
{
  "id": "12345",
  "name": "Tech Innovations Inc.",
  "legalName": "Tech Innovations Incorporated",
  "registrationNumber": "TIN-987654321",
  "industry": "Technology",
  "logo": "https://example.com/logo.png",
  "description": "Innovative solutions for modern businesses.",
  "email": "contact@techinnovations.com",
  "phone": "+1234567890",
  "website": "https://techinnovations.com",
  "address": {
    "street": "123 Tech Lane",
    "city": "Silicon Valley",
    "state": "California",
    "postalCode": "94027",
    "country": "USA"
  },
  "contactPerson": {
    "name": "Jane Doe",
    "email": "jane.doe@techinnovations.com",
    "phone": "+1234567891"
  },
  "employeesCount": 150,
  "foundedYear": 2010,
  "businessHours": "Mon-Fri 9 AM to 5 PM",
  "status": "Active",
  "createdByUserId": "67890",
  "subscriptionPlan": "Pro",
  "billingInfo": {
    "billingEmail": "billing@techinnovations.com",
    "paymentMethod": "Credit Card"
  },
  "createdAt": "2024-12-10T10:00:00Z",
  "updatedAt": "2024-12-11T12:00:00Z",
  "adminUserIds": ["67890", "67891"],
  "memberUserIds": ["67892", "67893", "67894"],
  "tags": ["Technology", "Software", "Innovation"],
  "metadata": {
    "customField1": "value1",
    "customField2": "value2"
  }
}
```

---

### Additional Considerations
- **Scalability**: Ensure your model can handle future requirements by using optional fields like `metadata` or `tags`.
- **Performance**: For fields with lists (e.g., `adminUserIds`, `memberUserIds`), consider indexing them in your database for faster queries.
- **Validation**: Validate key fields like `email`, `phone`, and `website` to ensure data integrity.
- **Security**: Protect sensitive fields like `billingInfo` to comply with data protection laws (e.g., GDPR, CCPA).

This structure should be adaptable to most business needs while remaining flexible for future changes.

*/