# Shared by the hooks: finds the repo root and the gitleaks binary.
ROOT=$(git rev-parse --show-toplevel) || exit 1
# Hooks may run without mise activated (IDE, GUI client), so fall back to `mise which`.
GITLEAKS=$(command -v gitleaks || (cd "$ROOT" && mise which gitleaks 2>/dev/null))
if [ -z "$GITLEAKS" ]; then
  echo "secret scan: gitleaks not found. Run 'mise install' in $ROOT." >&2
  exit 1
fi

# Usage: scan <commit|push> <gitleaks args...>. Exits the hook unless the scan is clean.
# gitleaks exits 3 on a leak (set below) and 1 or 2 when it can't scan.
scan() {
  what=$1; shift
  "$GITLEAKS" "$@" --redact --no-banner --exit-code 3 --config "$ROOT/.gitleaks.toml"
  case $? in
    0) ;;
    3) echo "secret scan: possible secret found, $what blocked. See 'Secret scanning' in README.md." >&2; exit 1 ;;
    *) echo "secret scan: gitleaks failed to scan, $what blocked. See its output above." >&2; exit 1 ;;
  esac
}
