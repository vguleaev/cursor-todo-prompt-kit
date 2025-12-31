# cursor-todo-prompt-kit

This is a simple **Cursor Prompt Library** for managing tasks in a single `TODO.md` file.

`TODO.md` contains collection of "Jira-like" task items for AI Agents in Cursor.

This kit adds a small set of Cursor commands and rules that allow you to manage a "TODO.md" file.

## Core Idea

This project is built around one simple principle:

> **`TODO.md` is the source of truth for AI Agents in Cursor.**

Having all tasks in a single file allows AI Agents to:

- Have long term memory for the whole project
- Read task details and context
- Add,remove,update tasks as needed
- Start working on any task by its ID
- Continue working on tasks across multiple chat sessions

## How It Works

The kit creates `.cursor` folder with two subfolders:

- `commands` - contains Cursor commands
- `rules` - contains Cursor rules

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/vguleaev/cursor-todo-prompt-kit/main/install.sh | bash
```

This will create `.cursor` folder in the root of your project.

**It will never overwrite existing Cursor files.**

## Usage

To initialize `TODO.md` file, run the following command in Cursor chat:

```
/ct-init-todo Implement Oauth2 login feature
```

You can just ask any AI Agent to start working on a task by its ID:

```
Start working on task CT-456. Also check if task CT-123 is completed.
```

Or you can ask Cursor to add a new task to `TODO.md` file:

```
Add new task in TODO.md file to configure Tailwind CSS for frontend
```

## Additional commands

To add a new task to `TODO.md` file, run the following command in Cursor chat:

```
/ct-add-task Add and configure Tailwind CSS for frontend
```

To check task status by its ID in `TODO.md` file, run the following command in Cursor chat:

```
/ct-check-task-id CT-123
```

To start working on a task by its ID, run the following command in Cursor chat:

```
/ct-start-task-id CT-456
```

## Example of TODO.md

Here you can see a complete example of a `TODO.md` file that will be created by `/ct-init-todo` command.

https://github.com/vguleaev/cursor-todo-prompt-kit/blob/main/templates/TODO.md

## Files and Responsibilities

`TODO.md` is the single source of truth for all work.

- All tasks live here
- Tasks have unique IDs
- Tasks progress is tracked in "Progress Tracker" section of the `TODO.md` file

`.cursor/commands/` are explicit, user invoked actions such as:

- `/ct-init-todo` - Initializing `TODO.md` file
- `/ct-add-task` - Adding new task to `TODO.md` file
- `/ct-check-task-id` - Checking task status by its ID in `TODO.md` file
- `/ct-start-task-id` - Starting working on a task by its ID

`.cursor/rules/` are always-on rules how to work with `TODO.md` file.
