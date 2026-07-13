---
name: rpr
description: /review-pr のエイリアス。GitHubのプルリクエストをレビューする。`/rpr <PR番号>` でdiff・要約・コメント一覧を表示してLLMと議論できる。PR番号を省略するとPR一覧から選択できる。
user-invocable: true
allowed-tools:
  - Bash(gh pr view:*)
  - Bash(gh pr diff:*)
  - Bash(gh pr list:*)
  - Bash(gh repo view:*)
  - Read
  - Write
  - Bash(mkdir *)
  - Bash(date *)
---

`/review-pr` のエイリアスです。

`~/.claude/skills/review-pr/SKILL.md` を読み込み、その内容に従って実行してください。引数: `$ARGUMENTS`
