import { describe, it, expect, vi, beforeAll, afterAll, beforeEach } from 'vitest'
import fs from 'node:fs'
import path from 'node:path'

const { TMP } = vi.hoisted(() => ({
  TMP: `/tmp/cc-backup-test-${process.pid}-${Math.random().toString(36).slice(2, 8)}`,
}))

vi.mock('node:os', () => ({
  default: { homedir: () => TMP },
}))

import { backupTracker, appendUndoEntry, readUndoLog, getBackupDir, getUndoLogPath } from '../src/backup.js'

beforeAll(() => {
  fs.mkdirSync(TMP, { recursive: true })
})

afterAll(() => {
  fs.rmSync(TMP, { recursive: true, force: true })
})

describe('backupTracker', () => {
  const trackerContent = JSON.stringify({ schemaVersion: 1, project: {} }, null, 2)

  beforeEach(() => {
    const backupDir = getBackupDir()
    if (!fs.existsSync(backupDir)) fs.mkdirSync(backupDir, { recursive: true })
    const files = fs.readdirSync(backupDir).filter(f => f.startsWith('tracker_'))
    for (const f of files) fs.unlinkSync(path.join(backupDir, f))
  })

  it('creates a backup file', () => {
    const trackerPath = path.join(TMP, 'test-tracker.json')
    fs.writeFileSync(trackerPath, trackerContent)
    backupTracker(trackerPath)
    const backupDir = getBackupDir()
    const backups = fs.readdirSync(backupDir).filter(f => f.startsWith('tracker_'))
    expect(backups.length).toBe(1)
    const content = fs.readFileSync(path.join(backupDir, backups[0]), 'utf-8')
    expect(content).toBe(trackerContent)
  })

  it('does not fail if tracker does not exist', () => {
    expect(() => backupTracker(path.join(TMP, 'nonexistent.json'))).not.toThrow()
  })

  it('prunes oldest backups beyond MAX_BACKUPS', () => {
    const trackerPath = path.join(TMP, 'prune-tracker.json')
    fs.writeFileSync(trackerPath, trackerContent)
    for (let i = 0; i < 25; i++) {
      backupTracker(trackerPath)
    }
    const backupDir = getBackupDir()
    const backups = fs.readdirSync(backupDir).filter(f => f.startsWith('tracker_')).sort()
    expect(backups.length).toBeLessThanOrEqual(20)
  })
})

describe('appendUndoEntry', () => {
  beforeEach(() => {
    const logPath = getUndoLogPath()
    if (fs.existsSync(logPath)) fs.unlinkSync(logPath)
  })

  it('writes JSONL entries', () => {
    appendUndoEntry({ timestamp: '2026-01-15T10:00:00Z', tool: 'test', before: '{}', after: '{}' })
    appendUndoEntry({ timestamp: '2026-01-15T11:00:00Z', tool: 'test2', before: '{}', after: '{}' })
    const logPath = getUndoLogPath()
    const content = fs.readFileSync(logPath, 'utf-8')
    const lines = content.trim().split('\n')
    expect(lines.length).toBe(2)
    expect(JSON.parse(lines[0]).tool).toBe('test')
    expect(JSON.parse(lines[1]).tool).toBe('test2')
  })

  it('prunes oldest entries beyond MAX_UNDO_ENTRIES', () => {
    for (let i = 0; i < 55; i++) {
      appendUndoEntry({ timestamp: new Date(Date.now() + i).toISOString(), tool: `tool_${i}`, before: '{}', after: '{}' })
    }
    const entries = readUndoLog()
    expect(entries.length).toBeLessThanOrEqual(50)
  })
})

describe('readUndoLog', () => {
  beforeEach(() => {
    const logPath = getUndoLogPath()
    if (fs.existsSync(logPath)) fs.unlinkSync(logPath)
  })

  it('returns empty array when no log exists', () => {
    expect(readUndoLog()).toEqual([])
  })

  it('parses entries correctly', () => {
    appendUndoEntry({ timestamp: '2026-01-15T10:00:00Z', tool: 'start_task', before: '{"status":"todo"}', after: '{"status":"in_progress"}' })
    const entries = readUndoLog()
    expect(entries.length).toBe(1)
    expect(entries[0].tool).toBe('start_task')
    expect(entries[0].before).toBe('{"status":"todo"}')
  })

  it('skips corrupt lines', () => {
    const logPath = getUndoLogPath()
    fs.writeFileSync(logPath, 'corrupt line\n{"timestamp":"2026-01-15","tool":"ok","before":"{}","after":"{}"}\n')
    const entries = readUndoLog()
    expect(entries.length).toBe(1)
    expect(entries[0].tool).toBe('ok')
  })
})
