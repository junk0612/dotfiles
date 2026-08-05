---
name: dev-environment
description: この開発環境（シェル・ランタイム・ツール・dotfiles 運用）の前提を確認したいときに使う。ツールのインストール、シェル設定、リポジトリの取得・移動、環境まわりでつまずいたときに参照する。
---

# 開発環境の前提

## OS・シェル
- WSL2 上の zsh。タイムゾーンは Asia/Tokyo。
- zsh にはプラグインを入れない（管理が大変なので入れない方針）。`auto_cd` / `auto_pushd` は有効。

## ランタイム・リポジトリ管理
- ランタイム（ruby / go / neovim / deno など）は asdf で管理する。`.tool-versions` に集約。
- リポジトリは ghq で管理する。`gcd` で目的のリポジトリへ移動する。
- `asdf install rust` は CARGO_HOME を `~/.asdf/installs/rust/<ver>` に向けるため、`cargo install` したバイナリはそのバージョン配下に入る（`asdf reshim rust` で shim が張られる）。**rust のバージョンを上げると入れ直しになる**ので、cargo 製のツールを常用するときは覚えておく。
  - なので常用するツールは、prebuilt があるなら `cargo install` せず **`~/.local/bin` に置く**（`.zshenv` の PATH に入っており、asdf のバージョン更新から独立する）。
    実例: nvim-treesitter の `main` ブランチが要求する `tree-sitter` CLI は、GitHub Releases の
    `tree-sitter-linux-x64.gz` を展開して `~/.local/bin/tree-sitter` に置く。過去に `cargo install` したせいで
    rust を上げたときに消え、パーサが一切ビルドできなくなったことがある。

## エディタ・ツール
- エディタは Neovim + lazy.nvim。
- Docker は有料の Docker Desktop ではなく無料版を使う。
- ツールは「必要になったら入れる／不要になったら消す」方針。常設ツールを増やさない。

## ツール導入でつまずいたとき
- 公式配布の prebuilt バイナリが、この環境で動くとは限らない（glibc など OS 側のバージョン要求）。
  実行できなければ `ldd --version` と `objdump -T <bin> | grep GLIBC` で要求バージョンを確認する。
- 動かないときはソースビルドに切り替える。ビルド依存が重い場合、
  default feature を削って不要な依存（JS エンジン・libclang など）を落とせないか先に確認する。

## dotfiles 運用
- 設定は `~/dotfiles` に集約し、`setup.sh` で symlink する。
- `~/.claude` と `~/.codex` はランタイム状態（認証・セッション・キャッシュ）を持つため、ディレクトリごとではなく設定ファイルを個別に symlink する。
- 仕事用プロジェクト固有の設定は、そのプロジェクトのリポジトリにはコミットしない。
