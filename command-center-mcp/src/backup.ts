import path from 'node:path'
import fs from 'node:fs'
import os from 'node:os'

const BACKUP_DIR = path.join(os.homedir(), '.command-center', 'backups')
const UNDO_LOG_PATH = path.join(os.homedir(), '.command-center', 'undo-log.jsonl')
const MAX_BACKUPS = 20
const MAX_UNDO_ENTRIES = 50

export interface UndoEntry {
  timestamp: string
  tool: string
  before: string
  after: string
}

function ensureDir(dirPath: string): void {
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true })
  }
}

export function backupTracker(trackerPath: string): void {
  ensureDir(BACKUP_DIR)
  if (!fs.existsSync(trackerPath)) return

  const timestamp = new Date().toISOString().replace(/[:.]/g, '-')
  const backupName = `tracker_${timestamp}.json`
  const backupPath = path.join(BACKUP_DIR, backupName)

  fs.copyFileSync(trackerPath, backupPath)

  const files = fs.readdirSync(BACKUP_DIR)
    .filter(f => f.startsWith('tracker_') && f.endsWith('.json'))
    .sort()
  while (files.length > MAX_BACKUPS) {
    const oldest = files.shift()
    if (oldest) fs.unlinkSync(path.join(BACKUP_DIR, oldest))
  }
}

export function appendUndoEntry(entry: UndoEntry): void {
  ensureDir(path.dirname(UNDO_LOG_PATH))
  const line = JSON.stringify(entry) + '\n'
  fs.appendFileSync(UNDO_LOG_PATH, line, 'utf-8')

  const content = fs.readFileSync(UNDO_LOG_PATH, 'utf-8')
  const lines = content.trim().split('\n').filter(Boolean)
  while (lines.length > MAX_UNDO_ENTRIES) {
    lines.shift()
  }
  fs.writeFileSync(UNDO_LOG_PATH, lines.join('\n') + '\n', 'utf-8')
}

export function readUndoLog(): UndoEntry[] {
  if (!fs.existsSync(UNDO_LOG_PATH)) return []
  const content = fs.readFileSync(UNDO_LOG_PATH, 'utf-8')
  return content.trim().split('\n').filter(Boolean).map(line => {
    try { return JSON.parse(line) } catch { return null }
  }).filter((e): e is UndoEntry => e !== null)
}

export function getBackupDir(): string {
  return BACKUP_DIR
}

export function getUndoLogPath(): string {
  return UNDO_LOG_PATH
}
