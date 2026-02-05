# **Tier Two Infrastructure Repository**

This repository contains a multi-environment Terraform setup used to provision cloud resources safely across development, staging and production environments.

---

## **Environments**

We maintain three main environment branches:

### **Dev**

* Where developers experiment and intentionally break things
* Used for rapid development and iteration

### **Staging**

* A close replica of the production environment
* Cost-optimized
* Serves as the **Green environment** for pre-production testing

### **Prod**

* Live infrastructure
* Serves as the **Blue environment**
* **Direct pushes are not allowed**

---

## **Branching Workflow**

All work must be done using individual branches based on what you are implementing or updating.

### **Feature Branches**

Used when adding new functionality or infrastructure components.

```
feature/<name>
```

Example:

```
feature/alb
```

### **Fixes Branches**

Used when updating or correcting work after a PR review.

```
fixes/<name>
```

Example:

```
fixes/alb
```

### **Refactor Branches**

Used for renaming, cleanup, restructuring or improvements that do not change functionality.

```
refactor/<name>
```

Example:

```
refactor/alb
```

---

## **Folder Structure**

```bash
.
├── env
│   ├── dev
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── staging
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── prod
│       ├── backend.tf
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── modules
│   └── (Reusable modules placed here)
│
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf
└── README.md
```

---

## **Contributing**

Pull requests are welcome by all Member.
For major changes, please open an issue first to discuss what you would like to modify.

Ensure configurations are tested in the **dev** environment before promotion.

---

## **Contributors**
Here is the list **sorted alphabetically (A → Z)**:
1. **Ankush** Patil
2. **Bahar** Gharavi
3. **Eldar** Azimov
4. **Oyinkansola** Olabode
5. **Shirish** Joshi


---
## **License**
 MIT

