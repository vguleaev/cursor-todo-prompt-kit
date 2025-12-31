# ct-add-task

**For the given task, add a new task to the `TODO.md` file.**

## TODO.md file Rules

- New task ID must be unique.
- Task ID must be in the format of `CT-<number>`.
- You must add task to the "Progress Tracker" section of the `TODO.md` file.
- You must set task status to `🔲 TODO`.
- You must add task to the "Tasks" section of the `TODO.md` file.
- You must use the following task template:

```markdown
#### CT-<number>: {{TASK_NAME}}

**Description:**  
{{TASK_DESCRIPTION}}

**Acceptance Criteria:**

- [ ] {{ACCEPTANCE_CRITERIA_1}}
- [ ] {{ACCEPTANCE_CRITERIA_2}}
- [ ] {{ACCEPTANCE_CRITERIA_3}}
- [ ] {{ACCEPTANCE_CRITERIA_4}}
```
