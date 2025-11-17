
# Obsidian Word-Like Setup

このノートは、Vault 内の環境構築メモ。
別PCに引っ越すときも、この手順どおりにやれば再現できるように記述する。

---

## 1. フォルダ構成

- [ ] `Docs/` フォルダ作成
- [ ] `Templates/` フォルダ作成
- [ ] `.obsidian/snippets/word-like.css` を作成

---

## 2. プラグイン一覧（手動インストール）

- [ ] **Templater**
- [ ] **Automatic Table Of Contents**
- [ ] **Attachment 管理系プラグイン**（ノートごとに img/ へ保存する用）

※ プラグイン本体は Vault 外にあるので、PCを引っ越したらここを見て再インストールする。

---

## 3. テンプレート

- [ ] `Templates/WordDocTemplate.md` を作成
- [ ] `Templates/NewWordProject.md` を作成（Templater スクリプト）

---

## 4. CSS スニペット

- [ ] `.obsidian/snippets/word-like.css` を作成
- [ ] Obsidian 設定 → Appearance → CSS snippets から有効化

---

## 5. 画像保存ルール

- [ ] Attachment 管理プラグインを導入
- [ ] 保存パスを `{{notePath}}/img` 相当のルールに設定

---

## 6. エクスポート（あとでやる）

- [ ] Pandoc インストール（ローカルPC）
- [ ] `reference.docx`（フォーマット）を作る
- [ ] Obsidian → Pandoc 連携の設定
