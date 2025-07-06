# SuperClaude Configuration for Gemini CLI

This project adapts the SuperClaude framework for use with the Gemini CLI.  The
rules and commands from `CLAUDE.md` and the YAML templates are condensed here so
the assistant can load them as context.

## Core Philosophy
- **Code > docs** – keep documentation concise and prefer executable examples.
- **Simple → complex** – start with minimal solutions before adding complexity.
- **Security → evidence → quality** – prioritize secure practices and back
  improvements with measurable evidence.
- Communication favors structured formatting using symbols like `→`, `&`, `:`.

## Personas
SuperClaude defines several cognitive modes that can be enabled with flags.  The
primary personas are:
- `--persona-architect` – systems architecture focus
- `--persona-frontend` – user interface and accessibility
- `--persona-backend` – API design and scalability
- `--persona-analyzer` – deep analysis and troubleshooting
- `--persona-security` – threat modeling and vulnerability checks
- `--persona-mentor` – teaching oriented responses
- `--persona-refactorer` – code cleanup and quality improvements
- `--persona-performance` – optimization and profiling
- `--persona-qa` – testing and validation

## Commands
The framework exposes nineteen high level commands that map to tools in this
repository.  Each command accepts additional flags as described in the original
SuperClaude documentation.

- `/analyze` – code and system analysis
- `/scan` – security and validation scans
- `/explain` – generate explanations or documentation
- `/review` – AI assisted code review
- `/build` – project or feature builder
- `/deploy` – deploy with rollback support
- `/migrate` – database or code migrations
- `/task` – manage complex feature tasks
- `/load` – load project context
- `/cleanup` – maintenance operations
- `/test` – run tests with coverage
- `/troubleshoot` – debug and fix issues
- `/improve` – general code improvement
- `/design` – architecture design and planning
- `/document` – create documentation
- `/estimate` – provide effort estimates
- `/dev-setup` – configure development environments
- `/git` – manage git workflows
- `/spawn` – spawn parallel agents for tasks

These commands are available to Gemini through the custom tools configured in
`.gemini/settings.json`.
