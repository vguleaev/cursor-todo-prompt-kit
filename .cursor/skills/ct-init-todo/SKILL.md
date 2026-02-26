---
name: ct-init-todo
description: For the given feature, create a TODO.md file in the root of the project.
disable-model-invocation: true
---

# ct-init-todo

**For the given feature, create a `TODO.md` file in the root of the project.**

## TODO.md file Rules

- Generate as many tasks as you need to complete the feature.
- Each task must have a unique task ID.
- Task ID must be in the format of `CT-<number>`.
- You must use the following statuses: `✅ DONE`, `🔲 TODO`.
- You muse use prefix `CT-` for the task ID.
- Each task must have name, description and acceptance criteria.
- Add helpful notes which are common for all tasks at the end of the file.

**YOU MUST USE THE FOLLOWING TEMPLATE:**

```markdown
# TODO: {{FEATURE_NAME}}

{{FEATURE_DESCRIPTION}}

## Progress Tracker

| Ticket | Description     | Status       |
| ------ | --------------- | ------------ |
| CT-1   | {{TASK_1_NAME}} | {{STATUS_1}} |
| CT-2   | {{TASK_2_NAME}} | {{STATUS_2}} |

## Tasks

#### CT-1: {{TASK_1_NAME}}

**Description:**  
{{TASK_1_DESCRIPTION}}

**Acceptance Criteria:**

- [ ] {{ACCEPTANCE_CRITERIA_1}}
- [ ] {{ACCEPTANCE_CRITERIA_2}}
- [ ] {{ACCEPTANCE_CRITERIA_3}}
- [ ] {{ACCEPTANCE_CRITERIA_4}}

---

#### CT-2: {{TASK_2_NAME}}

**Description:**  
{{TASK_2_DESCRIPTION}}

**Acceptance Criteria:**

- [ ] {{ACCEPTANCE_CRITERIA_1}}
- [ ] {{ACCEPTANCE_CRITERIA_2}}
- [ ] {{ACCEPTANCE_CRITERIA_3}}

---

## Notes

- {{NOTE_1}}
- {{NOTE_2}}
- {{NOTE_3}}
```

## Find below complete example of a TODO.md file:

```markdown
# TODO: Expenses Tracker Backend

Implement insertion of a new expense into the database for our expenses tracker.

## Progress Tracker

| Ticket | Description            | Status  |
| ------ | ---------------------- | ------- |
| CT-1   | CDK Backend Stack      | ✅ DONE |
| CT-2   | Deploy Lambda Handlers | ✅ DONE |
| CT-3   | Custom Domain for API  | ✅ DONE |
| CT-4   | API Gateway Auth       | 🔲 TODO |

## Tasks

#### CT-1: Create CDK Backend Stack for Lambda + DynamoDB

**Description:**  
Create a new CDK stack (`backend-stack.ts`) that provisions:

- DynamoDB table for expenses with `id` as partition key and `userId-index` GSI
- Lambda functions for expense CRUD operations
- API Gateway REST API with proper CORS configuration
- IAM roles and permissions for Lambda to access DynamoDB

**Acceptance Criteria:**

- [x] DynamoDB table created with proper indexes
- [x] Lambda functions deployed for list/create expenses
- [x] API Gateway configured with routes
- [x] Stack outputs API URL

---

#### CT-2: Deploy Expense Lambda Handlers

**Description:**  
Bundle and deploy existing Lambda handlers (`create.ts`, `list.ts`) to AWS via CDK. Ensure environment variables are properly configured.

**Acceptance Criteria:**

- [x] Create expense Lambda deployed
- [x] List expenses Lambda deployed
- [x] Environment variables set (EXPENSES_TABLE_NAME)
- [x] Handlers return proper responses

---

#### CT-3: Add Custom Domain for API Gateway

**Description:**  
Configure custom domain `api.expenses.example.com` for API Gateway. Reuse existing certificate if it supports wildcards, or update certificate to include the API subdomain.

**Acceptance Criteria:**

- [x] Check if existing certificate supports `*.expenses.example.com` or `api.expenses.example.com`
- [x] If not, request new/updated certificate with wildcard support
- [x] Add custom domain to API Gateway in CDK
- [x] Created DNS record for `api.expenses.example.com`
- [x] API accessible via `https://api.expenses.example.com`

---

#### CT-4: Configure API Gateway with Clerk Auth Integration

**Description:**  
Set up API Gateway to validate Clerk JWT tokens. Configure Lambda authorizer or pass user ID from Clerk session to backend.

**Acceptance Criteria:**

- [ ] API Gateway validates auth headers
- [ ] User ID extracted from Clerk token
- [ ] Unauthorized requests return 401

---

## Notes

- Backend handlers already exist in `/backend/src/handlers/expenses/`
- Auth utility exists in `/backend/src/lib/auth.ts`
- Frontend uses Clerk for authentication
- DynamoDB requires `userId-index` GSI for listing user's expenses
```

**NOW, CREATE A TODO.md FILE FOR THE GIVEN FEATURE:**
