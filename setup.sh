#!/usr/bin/env bash
set -e

# Derive project name from repo folder
PROJECT_NAME=$(basename "$(git rev-parse --show-toplevel)")

echo "🔧 Setting up project: $PROJECT_NAME"

# Replace placeholders {{ project_name }} in all files
grep -rl "{{ project_name }}" . | xargs sed -i "s/{{ project_name }}/$PROJECT_NAME/g"

echo "✅ Project setup complete!"
