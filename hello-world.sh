#!/usr/bin/env bashp

# Option 1
# Include (once) using the "#include" directive

#include test/hello
test::hello

#include test/test/hello
test::test::hello

# Option 2
# Rely on auto-include based on naming-convention "<package>::<function>"

test::hello_world

# Option 3
# Use nested package paths for better organization

#include test/test/hello
test::test::hello

test::test::hello_world
