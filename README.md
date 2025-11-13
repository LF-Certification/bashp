[![basher install](https://www.basher.it/assets/logo/basher_install.svg)](https://www.basher.it/package/)

# Bash+ (bashp)

Bash+ (bashp) is an enhanced Bash scripting framework designed to extend the capabilities of
standard Bash scripts with modular, package-based functionality. It introduces a preprocessing step
to Bash scripting that allows for the inclusion of external or custom libraries and packages
directly within scripts. This is achieved through a series of tools: `bashp`, `bashpc`, and
`bashpp`, which preprocess scripts, manage dependencies, and facilitate the integration of complex
functionalities with ease.

## Features

- **Modular Design**: Easily include and manage external libraries and packages in your Bash
  scripts.
- **Package Management**: Leverage reusable components and packages from multiple sources:
  - OCI registries (Docker/other OCI clients)
  - GitHub releases
  - Local directories
- **Enhanced Scripting Capabilities**: Make your Bash scripts more powerful and maintainable with
  advanced features.
- **Preprocessing**: A preprocessing step that allows for dynamic inclusion of scripts and
  packages, supporting multiple package sources and enhancing modularity.
- **Built-in Testing Framework**: Simple, convention-based testing with container isolation and
  visual feedback (✅ ⛔ ⚙️ ⚠️). [Learn more →](docs/TESTING.md)
- **Git Integration**: Automatically adds included functions to `.gitignore` when pulling from
  external sources, preventing unintended commits.

## Getting Started

You can install Bash+ in two ways:

### Option 1: Using Basher (Recommended)

The easiest way to install Bash+ is using [Basher](https://www.basher.it/), a package manager for
Bash scripts:

```bash
# Install basher if you haven't already
curl -s https://raw.githubusercontent.com/basherpm/basher/master/install.sh | bash

# Install Bash+
basher install lf-certification/bashp
```

### Option 2: Manual Installation

Alternatively, you can clone this repository and ensure you have Docker and `curl` installed, as
they are required for fetching some of the packages. Ensure Git is configured correctly if you're
using Bash+ in a Git-managed project. Bash+ intelligently adds dynamically included functions to
`.gitignore`, keeping your repository clean.

### Usage

Use the `bashp` command to run your script, which will automatically preprocess and execute it:

```bash
bashp yourscript.sh
```

### Quickstart Example

Here's a simple [example](hello-world.sh) to get you started with Bash+:

```shell
#!/usr/bin/env bashp

# Option 1
# Include (once) using the "#include" directive

#include test/hello
test::hello

# Option 2
# Rely on auto-include based on naming-convention "<package>::<function>"

test::hello_world

# Option 3
# Use nested package paths for better organization

#include test/test/hello
test::test::hello

test::test::hello_world
```

This script demonstrates three ways to include and use functions from external libraries or packages
in your Bash+ scripts. The third option shows how to use nested package paths for better organization
of your code.

### Testing Your Code

Bash+ includes a built-in testing framework that makes it easy to test your functions:

```bash
# Test a specific function
bashpt user::get_uid

# Run tests locally without container isolation
BASHPT_LOCAL=true bashpt user::get_uid
```

Tests are automatically discovered based on naming conventions and run in isolated Docker containers
by default. For more details, see the [Testing Documentation](docs/TESTING.md).

### Package Path Resolution

Bash+ supports nested package paths, allowing for better organization of your code. For example:
- `test::hello` - Basic package path
- `test::test::hello` - Nested package path
- `org::team::project::module::function` - Deeply nested package path

This hierarchical structure helps organize related functions and makes the codebase more maintainable.

### Git Integration

Bash+ automatically manages your `.gitignore` file:
- Dynamically adds included functions to prevent unintended commits
- Supports both GitHub and OCI package sources
- Maintains a clean repository by tracking only necessary files

## Contributing

Contributions are welcome! Please feel free to submit pull requests, open issues, or suggest new
features.

## License

This project is licensed under the BSD-3-Clause license - see the [LICENSE](LICENSE) file for
details.
