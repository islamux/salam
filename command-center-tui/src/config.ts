import path from 'node:path'
import fs from 'node:fs'

export const PROJECT_ROOT = process.env.PROJECT_ROOT
  ?? (() => {
    try {
      const envPath = path.resolve('.env')
      const content = fs.readFileSync(envPath, 'utf-8')
      const match = content.match(/^PROJECT_ROOT=(.+)$/m)
      return match ? match[1].trim() : process.cwd()
    } catch {
      return process.cwd()
    }
  })()

export const TRACKER_PATH = path.resolve(path.join(PROJECT_ROOT, 'project-tracker.json'))
