-- pagebreak.lua
-- Markdown 中の <div style="page-break-after: always;"></div>
-- を docx のページ区切りに変換する Lua フィルタ

function RawBlock(el)
  -- HTML の生ブロックだけ見る
  if el.format == "html" and el.text then
    -- style に page-break-after: always が含まれているかチェック
    if el.text:match("page%-break%-after:%s*always") then
      -- docx 用ページ区切り (OpenXML)
      return pandoc.RawBlock(
        "openxml",
        '<w:p><w:r><w:br w:type="page"/></w:r></w:p>'
      )
    end
  end

  -- それ以外はそのまま
  return nil
end
