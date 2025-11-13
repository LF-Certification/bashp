# Testing in Bash+

Bash+ includes a lightweight testing framework designed with the same philosophy as the framework
itself: simple, modular, and convention-based. Tests are easy to write, run in isolated
environments, and provide clear visual feedback.

## Quick Start

To run tests for any Bash+ function:

```bash
bashpt user::get_uid
```

This automatically finds and runs the test for the `user::get_uid` function.

## Test Organization

Tests follow a predictable convention based on function names:
- Function: `user::get_uid`
- Test location: `libs/user/tests/get_uid/test`
- Test function: `user::tests::get_uid::test`

This convention eliminates configuration and makes test discovery automatic.

## Writing Tests

Here's a simple test example:

```bash
# shellcheck shell=bash

#include user/get_home
#include core/test/assert_equals
#include core/test/assert_success
#include core/test/assert_failure
#include core/test/assert_contains
#include core/test/prep_step

function user::tests::get_home::test() {
  local sudo=""
  if [[ $EUID -ne 0 ]] && command -v sudo &>/dev/null; then
    sudo="sudo"
  fi

  # Test with explicit username
  core::test::assert_success user::get_home root
  core::test::assert_equals /root "$(user::get_home root)"
  core::test::assert_success test -d /root

  # Test with no argument (should default to current user)
  local current_user expected_home
  current_user=$(whoami)
  expected_home=$(user::get_home "$current_user")
  core::test::assert_success user::get_home
  core::test::assert_equals "$expected_home" "$(user::get_home)"

  # Test with a custom user
  core::test::prep_step $sudo useradd -m testuser
  core::test::assert_success user::get_home testuser
  
  local home_dir
  home_dir=$(user::get_home testuser)
  core::test::assert_equals /home/testuser "$home_dir"
  core::test::assert_contains "$home_dir" "testuser"
  
  core::test::prep_step $sudo userdel -r testuser

  # Test failure case
  core::test::assert_failure user::get_home non_existent_user
}
```

## Assertion Functions

Bash+ provides a comprehensive set of assertion functions with visual feedback:

### Basic Assertions
- `core::test::assert_success` - Verifies a command exits with status 0
- `core::test::assert_failure` - Verifies a command exits with non-zero status
- `core::test::assert_exit_code` - Verifies a command exits with a specific exit code
- `core::test::assert_equals` - Compares expected and actual values

### String Assertions
- `core::test::assert_contains` - Verifies a string contains a substring
- `core::test::assert_not_contains` - Verifies a string does not contain a substring
- `core::test::assert_output` - Verifies a command produces expected output

### System Assertions
- `core::test::assert_command_exists` - Verifies a command exists in PATH

### Async Assertions
- `core::test::assert_eventually` - Retries a condition until it succeeds or times out (useful for async operations)

### Test Preparation
- `core::test::prep_step` - Executes preparational steps (like creating test users or files) with distinct visual feedback

Visual indicators:
- ✅ Passed assertions
- ⛔ Failed assertions
- ⚙️ Successful preparation steps
- ⚠️ Failed preparation steps

## Container Execution

By default, tests run in an isolated Docker container to ensure consistency across environments.
This is particularly useful for:
- System-level testing (user management, file permissions)
- Testing across different Linux distributions
- Ensuring a clean environment for each test run

### Configuration Options

Control test execution with environment variables:

```bash
# Run tests locally instead of in a container
BASHPT_LOCAL=true bashpt user::get_uid

# Use a specific container image
BASHPT_IMAGE=alpine:latest bashpt user::get_uid

# Run tests as a specific user
BASHPT_USER=testuser bashpt user::get_uid
```

### Default Behavior

- Container: `ubuntu:latest`
- User: `root` (configurable via `BASHPT_USER`)
- Automatic cleanup after test execution

## Test Independence

Each test is self-contained and handles its own setup and teardown. This explicit approach makes
tests:
- Easy to understand
- Simple to debug
- Independent from other tests
- Reproducible

## Best Practices

1. **Keep tests focused**: Test one function at a time
2. **Use prep_step for setup**: Distinguish test preparation from actual assertions
3. **Clean up resources**: Remove any users, files, or processes created during testing
4. **Use meaningful assertions**: Test both success and failure cases
5. **Leverage containers**: Use container isolation for system-level tests
6. **Follow conventions**: Place tests in the expected location for automatic discovery

## Philosophy

The Bash+ testing framework embodies the same principles as Bash+ itself:
- **Convention over configuration**: Tests are discovered automatically
- **Simplicity**: Minimal abstraction, maximum clarity
- **Modularity**: Reusable assertion functions
- **Practicality**: Visual feedback and straightforward debugging

You don't need complex test runners or elaborate frameworks. Just write functions that test your
code, and `bashpt` handles the rest.
