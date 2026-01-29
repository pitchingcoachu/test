#!/usr/bin/env python3
# Fix the broken JavaScript string in app.R

with open('app.R', 'r') as f:
    lines = f.readlines()

# Line 19850 (index 19849) is broken
# Line 19851 (index 19850) continues it
line_19850 = lines[19849]
line_19851 = lines[19850]

# The broken line should be:
# var manual = document.querySelector('input.workload-manual-input[data-player="' + player + '"][data-date="' + date + '"]');
# Then on a new line:
# var enabled = ['B+','A','A+'].includes(select.value);

# Reconstruct the correct lines
fixed_line_19850 = "          var manual = document.querySelector('input.workload-manual-input[data-player=\"' + player + '\"][data-date=\"' + date + '\"]');\n"
fixed_line_19851 = "          var enabled = ['B+','A','A+'].includes(select.value);\n"

# Replace the lines
lines[19849] = fixed_line_19850
lines[19850] = fixed_line_19851

# Write back
with open('app.R', 'w') as f:
    f.writelines(lines)

print("Fixed lines 19850-19851")
