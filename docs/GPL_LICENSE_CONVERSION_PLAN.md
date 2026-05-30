# Plan: Convert All GitHub Repos to GPL-3.0

## Scope

**47 repos total** on github.com/islamux

| Category | Count | Action |
|----------|-------|--------|
| Already GPL-3.0 | 2 | Skip — no change needed |
| Currently MIT | 8 | Replace LICENSE file with GPL-3.0 |
| No license | 39 | Add GPL-3.0 LICENSE file |
| Other (palestine-history-edu) | 1 | Review & convert if appropriate |

---

## Phase 1: Preparation (commands to run locally)

### 1a. Download the GPL-3.0 license text

```bash
curl -sL https://www.gnu.org/licenses/gpl-3.0.txt > /tmp/gpl-3.0.txt
```

### 1b. Choose working mode

**Option A — Clone each repo, update, push (one by one)**
Best if you want to review each repo individually.

**Option B — Bulk script (suggested)**
Generate a script that does all of them at once, since the LICENSE file is identical for all.

### 1c. Handle contributors (legal check)

Before converting MIT → GPL, check if any repo has external contributors:

```bash
# Check each MIT repo for non-you contributors
for repo in command-center Athkarix bassaer dev-portfolio salam-nextjs quran-memorization-school MikrotikApp employee-mgmt-offline; do
  echo "=== $repo ==="
  gh api repos/islamux/$repo/contributors --jq '.[].login' | grep -v islamux
done
```

**If you're the sole contributor on all of them** → you own 100% of the copyright → you can relicense freely.

**If there are external contributors** → under MIT, they granted you a license but you can't revoke theirs. You'd need their agreement to relicense their contributions under GPL, or keep the MIT header on their files.

*Note: For repos with no license at all, adding GPL-3.0 is a fresh grant — no conversion needed.*

---

## Phase 2: Execute

### 2a. Bulk update script

Create a script that does the following for each repo (MIT → GPL and no-license → GPL):

```bash
#!/usr/bin/env bash
set -e

REPOS=(
  # MIT → GPL (8 repos)
  command-center Athkarix bassaer dev-portfolio salam-nextjs
  quran-memorization-school MikrotikApp employee-mgmt-offline

  # No license → GPL (39 repos)
  fi-thilal-al-quran new-muslim-stories voices-of-truth salam
  ai-news-antigravity istighfar-stories athkari-web ai-thaker
  shaykh-abu-ishaq discover-islam muazzaf ai-news
  temp-monitor-raspberrypi4 islamux ai-search qissas-al-mustaghfireen
  da3wa-guide who-wants-million-vue2 quran-js salam-web
  convert-salamapp-string-class-to-json islamuxDevJourney mothaker
  islamic-guide hello_world flutter-advanced-cours
  sdf_management_system_flutter sdf_management_system_app
  dotfiles network-brain raspberrypi-server pihole-in-docker-in-rasperypi4
  script-switch-minimax-glm sdf_docs islamux-configs MyConfigurations
  alpha-spy-x bootstrap_finder jalabia-world
)

# palestine-history-edu is excluded — review separately

TMPDIR=$(mktemp -d)

for repo in "${REPOS[@]}"; do
  echo "=== $repo ==="
  cd "$TMPDIR"
  gh repo clone islamux/"$repo" -- "$repo"
  cd "$repo"
  cp /tmp/gpl-3.0.txt LICENSE
  git add LICENSE
  git commit -m "chore: license project under GPL-3.0"
  git push origin HEAD
  cd "$TMPDIR"
  rm -rf "$repo"
done

rm -rf "$TMPDIR"
```

### 2b. Update repo description on GitHub

After the LICENSE file is pushed, GitHub auto-detects it. You can also set it explicitly:

```bash
gh repo edit islamux/<repo> --license gpl-3.0
```

### 2c. Update README badges

For repos that have READMEs with MIT badges, update to GPL-3.0:

```markdown
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
```

---

## Phase 3: Special Cases

### palestine-history-edu (license: "Other")
Check what the current license is before converting. Run:
```bash
gh api repos/islamux/palestine-history-edu/license --jq '.license.key'
```

### Repos with external dependencies
- If you forked a repo that had its own license, changing the fork's license may conflict with upstream. Check the fork's origin.
- If the repo includes third-party code under a different license, that code keeps its original license — only your original work gets GPL'd.

---

## Summary of Effort

| Step | Time estimate |
|------|--------------|
| Phase 1 (prep + legal check) | ~15 min |
| Phase 2a (bulk script) | ~30 min (depends on clone/push speed) |
| Phase 2b (update README badges) | ~30 min |
| Phase 3 (special cases) | ~15 min |
| **Total** | **~1.5 hours** |

---

## One-Time Setup

```bash
# Authenticate gh CLI (already done)
gh auth status

# Download GPL-3.0 text
curl -sL https://www.gnu.org/licenses/gpl-3.0.txt > /tmp/gpl-3.0.txt
```

Ready to start when you are.
