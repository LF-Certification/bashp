#!/usr/bin/env bashp

# Option 1
# Include (once) using the "#include" directive

#include test/hello
test::hello

# Option 2
# Rely on auto-include based on naming-convention "<package>::<function>"

test::hello_world
