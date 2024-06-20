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
- **Package Management**: Leverage reusable components and packages, potentially hosted in external
  repositories or available as Docker images.
- **Enhanced Scripting Capabilities**: Make your Bash scripts more powerful and maintainable with
  advanced features.
- **Preprocessing**: A preprocessing step that allows for dynamic inclusion of scripts and
  packages. Supports including functions from local directories or Docker repositories, enhancing
  modularity and ease of use.
- **Git Integration**: Automatically adds included functions to `.gitignore` when pulling from OCI
  registries, preventing unintended commits of external functions.

## Getting Started

To get started with Bash+, clone this repository and ensure you have Docker installed, as it's
required for fetching some of the packages. Ensure Git is configured correctly if you're using
Bash+ in a Git-managed project. Bash+ intelligently adds dynamically included functions to
`.gitignore`, keeping your repository clean.

### Usage

Use the `bashp` command to run your script, which will automatically preprocess and execute it:

```bash
bashp yourscript.sh
```

### Quickstart Example

Here's a simple [example](hello-world.sh) to get you started with Bash+:

```shell
#!./bashp
# shellcheck shell=bash

# Option 1
# Include (once) using the "#include" directive

#include test/hello
test::hello

# Option 2
# Rely on auto-include based on naming-convention "<package>::<function>"

test::hello_world
```

This script demonstrates two ways to include and use functions from external libraries or packages in your Bash+ scripts.

## Contributing

Contributions are welcome! Please feel free to submit pull requests, open issues, or suggest new
features.

## License

This project is licensed under the BSD-3-Clause license - see the [LICENSE](LICENSE) file for details.
