## Objective: Apply normalization principles to ensure the database is in the third normal form (3NF).

## In Short:
* 1NF: Ensures no repeating groups and each column contains atomic values.
* 2NF: Removes partial dependencies, ensuring that non-key attributes depend on the full composite key.
* 3NF: Removes transitive dependencies, ensuring that non-key attributes depend only on the primary key.

---
### **First Normal Form (1NF):**

A table is in **1NF** if:

- **All columns contain atomic (indivisible) values**: Each value in a column should be a single, indivisible value (not a list, array, or set of values). For example, a column like **`phone_number`** should not contain multiple phone numbers (e.g., **`123-456-7890, 987-654-3210`**); instead, each phone number should be a separate entry in its own row or another table.
- **No repeating groups or arrays**: There should be no repeating groups or nested lists in a table. For example, a **`student_courses`** table should not have multiple columns like **`course_1`**, **`course_2`**, **`course_3`**. Instead, there should be a single **`course_id`** column, and each row should represent a single student's enrollment in a single course.

In summary, a table is in **1NF** if every field contains only atomic values and there are no repeating groups.

### **Second Normal Form (2NF):**

A table is in **2NF** if:

- It is **in 1NF**.
- There are **no partial dependencies**: A **partial dependency** occurs when a non-key attribute (column) depends on only part of a **composite primary key** (i.e., when the primary key consists of more than one column).

### **Example of Partial Dependency:**

Let’s say we have a table called **`OrderItems`** with a composite primary key **`order_id`** and **`product_id`**. If the table also contains an attribute like **`product_price`**, and if **`product_price`** only depends on **`product_id`** (not the entire composite key), then this would be a partial dependency.

**To avoid partial dependencies** in 2NF, we would move attributes like **`product_price`** to a separate table that links **`product_id`** to **`product_price`**. The **OrderItems** table would then only store **`order_id`**, **`product_id`**, and any other attributes that depend on the combination of both **`order_id`** and **`product_id`**.

### **Third Normal Form (3NF):**

A table is in **3NF** if:

- It is **in 2NF**.
- There are **no transitive dependencies**: A **transitive dependency** occurs when a non-key attribute depends on another non-key attribute, rather than depending on the primary key.

### **Example of Transitive Dependency:**

Consider a table where we have **`employee_id`**, **`employee_name`**, and **`employee_address`**. If the **`employee_address`** depends on the **`employee_name`** (not directly on **`employee_id`**), then there is a transitive dependency. The **`employee_address`** should depend directly on the **`employee_id`** and not indirectly through **`employee_name`**.

To remove transitive dependencies in **3NF**, we would move **`employee_address`** into a separate table linked to **`employee_id`** directly, instead of depending on **`employee_name`**.

### **Applying the Concepts to Your Schema**

In your schema, when we say the table "appears to be in **1NF** and **2NF**" and there are "no repeating groups or partial dependencies," it means:

1. **1NF** is satisfied because each attribute contains atomic values (no lists, sets, or multiple values in a column).
2. **2NF** is satisfied because there are no partial dependencies — all non-key attributes depend on the entire primary key (if there is a composite key), not just part of it.

When we mention that "there are no transitive dependencies," it means that all non-key attributes depend directly on the primary key and not on other non-key attributes in the table.