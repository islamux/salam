# MS-9: Data Files Standardization & Cleanup

**Branch:** `fix/data-files-standardization`
**Created:** 2026-05-15
**Last Updated:** 2026-06-20
**Status:** 🟡 Superseded — most issues resolved by MS-GEN work

---

## Original Scope

Standardize naming, fix typos, clean dead code, and unify formatting across all 68 data files:
- **34 list files** (`lib/core/data/model/khatira_lists/`) — generated
- **34 text files** (`lib/core/data/static/text/`) — source

---

## What Was Resolved

### ✅ Class naming (was 9.1)
Generator's `--fix-text` mode normalizes class names. All text files now use `KhatiraTextDers{X}` pattern.

### ✅ Typos & field names (was 9.3)
`--fix-text` mode covers via `typoMap`:
- `ayahaHadith*` → `ayahHadith*`
- `elmTexts*` → `khatiraText*`
- `FInal` → `Final`
- Various other typo variants

### ✅ Imports & dead code (was 9.2, 9.5, 9.7)
Generator regenerates list files cleanly — no commented-out code, no bad imports, no stale references.

### ✅ Naming convention
MS-GEN-4 stripped `NewOrder` suffix (model: `KhatiraModelNewOrder` → `KhatiraModelOrder`, files: `*_new_order.dart` → `*_order.dart`).

### ✅ Prefix rename
Generator produces `khatira_*` files/variables — not `elm_*`.

---

## What Remains

| Item | Scope | Notes |
|------|-------|-------|
| Text file page markers | `--fix-text` normalization | Generator `--fix-text` handles most cases |
| Field-level type annotations | Manual audit needed | MS-8.7 would touch these during splits |
| List file formatting | Regenerator handles | Run `dart run tool/generate_elm_lists.dart --rename-prefix khatira` |

---

## Current Status

Most MS-9 data quality issues are handled by the generator toolchain:
- `--fix-text` normalizes text source files
- Full regeneration produces clean list files
- Naming conventions enforced at generation time

Individual subtasks (9.1–9.7) are considered **superseded** by MS-GEN-3/4 tooling.
