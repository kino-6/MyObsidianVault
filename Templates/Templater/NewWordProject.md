---
title: プロジェクト名をここに
author: user
version: 1
status: draft
---

<%*
const pjName = await tp.system.prompt("Input Project Name");
if (!pjName) { new Notice("Cancel"); tR = ""; return; }

const base = "Docs";
const pj   = `${base}/${pjName}`;
const img  = `${pj}/img`;

if (!app.vault.getAbstractFileByPath(pj)) {
  await app.vault.createFolder(pj);
}

if (!app.vault.getAbstractFileByPath(img)) {
  await app.vault.createFolder(img);
}

const filePath = `${pj}/${pjName}.md`;

// 生成するMDの中身
const content = `---
title: ${pjName}
attachmentsDir: ${img}
author: user
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

# 付録
`;

// すでにあれば再利用、なければ作成
let file = app.vault.getAbstractFileByPath(filePath);
if (!file) {
  file = await app.vault.create(filePath, content);
}

// 新しいペインで開く
await app.workspace.getLeaf(true).openFile(file);

// このテンプレ自身には何も出力しない
tR = "";
-%>
