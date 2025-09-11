#!/usr/bin/env zsh
# Upgrade dependencies across all workspace packages using Melos.
# Usage:
#   ./scripts/upgrade_deps.sh          # dry-run (shows actions)
#   ./scripts/upgrade_deps.sh --apply  # actually perform upgrades and melos bootstrap

set -euo pipefail

DRY_RUN=true
MELIS_ARGS=()

for arg in "$@"; do
  case "$arg" in
    --apply)
      DRY_RUN=false
      ;;
    --help|-h)
      echo "Usage: $0 [--apply]"
      echo "  --apply   Actually run pub upgrade in each package and melos bootstrap"
      exit 0
      ;;
    *)
      MELIS_ARGS+=($arg)
      ;;
  esac
done

echo "Workspace root: $(pwd)"
if $DRY_RUN; then
  echo "DRY RUN: no changes will be made. Use --apply to perform upgrades."
else
  echo "APPLY MODE: running upgrades and then melos bootstrap"
fi

echo
echo "Discovering packages and planning upgrades via 'melos exec'..."

# Command executed in each package by melos exec
if $DRY_RUN; then
  MEL_CMD='echo "== Package: \$(basename \$(pwd)) =="; if grep -qE "^\s*flutter:" pubspec.yaml >/dev/null 2>&1; then echo "Would run: flutter pub upgrade"; else echo "Would run: dart pub upgrade"; fi'
else
  MEL_CMD='echo "== Package: \$(basename \$(pwd)) =="; if grep -qE "^\s*flutter:" pubspec.yaml >/dev/null 2>&1; then echo "Running: flutter pub upgrade"; flutter pub upgrade; else echo "Running: dart pub upgrade"; dart pub upgrade; fi'
fi

# Run melos exec which runs the command inside each package folder
echo "Running: melos exec -c <command>"
melos exec -c "$MEL_CMD" ${MELIS_ARGS[@]:+${MELIS_ARGS[@]}}

if ! $DRY_RUN; then
  echo
  echo "Re-running melos bootstrap to ensure workspace is synced..."
  melos bootstrap
  echo "Done."
fi

exit 0
