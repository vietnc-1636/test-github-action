#!/bin/bash
set -eu pipefail

current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch is: $current_branch"

echo "Start deploy!"
echo "Step 1: Pull code latest from repository"

git pull origin $current_branch

echo "Step 2: Run the composer installation"

composer install

echo "Step 3: Run the clear config, cache"

php artisan optimize:clear
