#!/usr/bin/env bash

set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_DIR="${VENV_DIR:-.venv}"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  echo "Error: $PYTHON_BIN not found. Install Python 3.11+ and try again." >&2
  exit 1
fi

echo "Creating virtual environment in ${VENV_DIR}..."
"$PYTHON_BIN" -m venv "$VENV_DIR"

# shellcheck disable=SC1090
source "${VENV_DIR}/bin/activate"

python -m pip install --upgrade pip
pip install -r requirements.txt
pip install pytest pytest-cov httpx

echo
echo "Done."
echo "Activate it with: source ${VENV_DIR}/bin/activate"
