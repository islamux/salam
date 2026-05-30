import fs from 'fs'
import path from 'path'

export function findProjectRoot(): string | null {
  // 1. Walk up from cwd first (prefer current project)
  let dir = process.cwd()
  while (dir !== '/') {
    if (fs.existsSync(path.join(dir, 'project-tracker.json'))) {
      return dir
    }
    // Also check dir/command-center/ (project root with nested cc)
    const ccDir = path.join(dir, 'command-center')
    if (fs.existsSync(path.join(ccDir, 'project-tracker.json'))) {
      return ccDir
    }
    dir = path.dirname(dir)
  }
  // 2. Fallback: check PROJECT_ROOT env var (stale/global config)
  if (process.env.PROJECT_ROOT) {
    if (fs.existsSync(path.join(process.env.PROJECT_ROOT, 'project-tracker.json'))) {
      return process.env.PROJECT_ROOT
    }
    const ccDir = path.join(process.env.PROJECT_ROOT, 'command-center')
    if (fs.existsSync(path.join(ccDir, 'project-tracker.json'))) {
      return ccDir
    }
  }
  return null
}

export function getTrackerPath(): string {
  const root = findProjectRoot()
  if (!root) {
    process.stderr.write('Error: project-tracker.json not found in any parent directory\n')
    process.exit(1)
  }
  return path.join(root, 'project-tracker.json')
}
