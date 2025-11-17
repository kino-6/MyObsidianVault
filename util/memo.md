
# Obsidian Word-Like Environment Setup  
---

## 1. 構成要素一覧

### ✔ Wordライク CSS スニペット
- `word-like.css` を `.obsidian/snippets/` に置く
- 用紙幅 / 日本語フォント / 見出し / 表などを Word 風にスタイリング

### ✔ Wordライク Markdown テンプレート  
- 「はじめに → 要求仕様 → 構成案 → 結論」の技術資料構成  
- 自動目次ブロック付き  
- Pandoc エクスポートにも相性良し

### ✔ PJフォルダ自動生成スクリプト（Templater）
- `Docs/<プロジェクト名>/` を自動作成
- `img/` サブフォルダも同時生成
- Wordライクテンプレの本文ファイルを自動生成
- フロントマターに `attachmentsDir` を設定

### ✔ 画像の自動保存先
- 「Attachment Management」系プラグインで  
  `notePath/img` のようにルール化可能  
- プロジェクト単位で `img/` に自動で貼り付け画像が入るようにできる

---

## 2. 推奨フォルダ構成
Vault/  
Docs/  
プロジェクト名/  
プロジェクト名.md  
img/  
Templates/  
WordDocTemplate.md  
NewWordProject.md  
.obsidian/  
snippets/  
word-like.css


---

## 3. CSS スニペット（word-like.css）

※ `.obsidian/snippets/word-like.css` に保存して有効化

```css
/* 全体：紙っぽい幅とフォント */
.markdown-preview-view,
.markdown-source-view.mod-cm6 {
  max-width: 800px;
  margin: 40px auto;
  padding: 32px;
  box-shadow: 0 0 8px rgba(0,0,0,0.08);
  background-color: #ffffff;
  font-family: "游ゴシック", "Yu Gothic", "メイリオ", "Meiryo", system-ui, sans-serif;
  line-height: 1.6;
  font-size: 14px;
}

/* 見出し */
.markdown-preview-view h1,
.markdown-source-view h1 {
  font-size: 2.2em;
  margin-bottom: 0.8em;
  border-bottom: 2px solid #ddd;
}

.markdown-preview-view h2,
.markdown-source-view h2 {
  font-size: 1.6em;
  margin-top: 1.6em;
  margin-bottom: 0.6em;
  border-left: 4px solid #666;
  padding-left: 0.4em;
}

.markdown-preview-view h3,
.markdown-source-view h3 {
  font-size: 1.3em;
  margin-top: 1.2em;
  margin-bottom: 0.4em;
}

# 1. はじめに

## 1.1 背景

## 1.2 目的

# 2. 要求仕様

## 2.1 前提条件

## 2.2 成功条件

# 3. 検討内容

## 3.1 構成案

## 3.2 評価結果

# 4. 結論・今後の方針

# 付録


---

## 5. PJフォルダ＋ノート自動生成スクリプト（NewWordProject.md）

```markdown
<%*
const pjName = await tp.system.prompt("プロジェクト名を入力してね");
if (!pjName) { new Notice("キャンセルされたよ〜"); tR=""; return; }

const base = "Docs";
const pj   = `${base}/${pjName}`;
const img  = `${pj}/img`;

if (!app.vault.getAbstractFileByPath(pj))
  await app.vault.createFolder(pj);

if (!app.vault.getAbstractFileByPath(img))
  await app.vault.createFolder(img);

const filePath = `${pj}/${pjName}.md`;

const content = `---
title: ${pjName}
attachmentsDir: ${img}
author: ゆっきー
status: draft
---

\`\`\`table-of-contents
maxLevel: 3
style: nestedList
\`\`\`

# 1. はじめに

## 1.1 背景

## 1.2 目的

# 2. 要求仕様

# 3. 検討内容

# 4. 結論・今後の方針
`;

let file = app.vault.getAbstractFileByPath(filePath);
if (!file) file = await app.vault.create(filePath, content);

await app.workspace.getLeaf(true).openFile(file);
tR = "";
-%>

## 6. 自動画像保存（Attachment Management）

設定例：

- 保存パス：
    
    `{{notePath}}/img`
    
- ファイル名：
    
    `{{date:YYYYMMDD_HHmmss}}_{{md5}}`
    

ポイント：  
「ノートがあるフォルダの直下に img/ があれば、そこへ保存される」。

---

## 7. Pandoc エクスポートとの相性

- 見出し階層が Word にそのまま反映
    
- 目次生成は Pandoc 側でも可能
    
- reference.docx を作れば会社仕様の Word 書式に完全対応可能
  
  
