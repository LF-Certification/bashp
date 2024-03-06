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
  packages.

## Getting Started

To get started with Bash+, clone this repository and ensure you have Docker installed, as it's
required for fetching some of the packages.

### Usage

Use the `bashp` command to run your script, which will automatically preprocess and execute it:

```bash
bashp yourscript.sh
```

## Contributing

Contributions are welcome! Please feel free to submit pull requests, open issues, or suggest new
features.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
