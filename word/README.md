# 📄 Word 版封面與書背<br>Word templates for cover & book spine

給**不用 LaTeX**、或只需要單獨印一張封面／書背的人。下載後用 Word 打開,
把 `【】` 裡的字換成自己的就好。

| 檔案 | 內容 |
|---|---|
| [`ntu-cover.docx`](ntu-cover.docx) | 封面／書名頁（規範附件 1–2） |
| [`ntu-bookspine.docx`](ntu-bookspine.docx) | 書背／側邊（規範 §2） |

---

## ⚠️ 先看這個：官方版在這裡

校方本身就有提供 Word 檔 ——
**[《國立臺灣大學碩、博士學位論文格式規範》THESISSAMPLE.doc](https://www.lib.ntu.edu.tw/doc/cl/THESISSAMPLE.doc)**
（臺大圖書館提供,內含附件 1 封面、附件 2 書名頁、附件 3 審定書、附件 4 摘要）。

**官方版永遠優先。** 本資料夾這兩份是**非官方便利版**,差別只在:
官方那份是 6 頁的規範文件（規則條文和範例混在一起）,本資料夾把封面和書背
**單獨抽出來做成填空檔**,省去自己從規範裡挖版面的功夫。

> 定稿送印前,請以官方檔與
> [圖書館論文繳交頁面](https://www.lib.ntu.edu.tw/node/103) 的最新規定核對。
> 若發現本檔與官方不符,**以官方為準**,並歡迎開 Issue 告知。

---

## 📐 版面規格（依規範實作）

兩份檔案的版面與本 repo 的 LaTeX 範本完全一致:

**封面** — A4,上留白 4 cm、下 3 cm、左右各 3 cm,全部置中

| 行 | 字級 | 字體 |
|---|---|---|
| 國立臺灣大學＋學院＋系所 | 18 pt | 標楷體 |
| 碩士／博士論文 | 18 pt | 標楷體 |
| Department / College | 14 pt | Times New Roman |
| National Taiwan University／學位英文 | 16 pt | Times New Roman |
| 中文題目 | 18 pt | 標楷體 |
| 英文題目 | 18 pt | Times New Roman |
| 姓名（中／英） | 18 pt | 標楷體／Times |
| 指導教授（中／英） | 18 pt | 標楷體／Times |
| 提出年月（中／英） | 18 pt | 標楷體／Times |

**書背** — 直式,含校名、系所、學位、中文題目、姓名、提出年月

---

## 💡 使用注意

- **字型**：檔案指定標楷體（DFKai-SB）與 Times New Roman。Windows＋Office
  通常都有;macOS 若缺標楷體,Word 會替換成其他字體,**送印前請確認**。
- **書背寬度**：範本用 3 cm 示意,**實際寬度取決於論文裝訂後的厚度**,
  請量過再調整表格欄寬。灰色框線只是示意範圍,**印刷前請刪除**。
- **碩士／博士**：把 `【碩士論文】` 改成 `【博士論文】`,英文行改
  `Doctoral Dissertation`。
- **精裝本**：規範規定碩士班紅底燙金字、博士班黑底燙金字,這部分由裝訂廠處理,
  不在 Word 檔內。

---

## 🔧 檔案怎麼產生的

`build-word-templates.js`（Node.js + [`docx`](https://www.npmjs.com/package/docx) 套件）。
要改版面就改這支再重跑:

```bash
npm install docx
node build-word-templates.js
```

版面數值直接對應 LaTeX 版 `ntuthesis.cls` 裡的 `\maketitlepage` 與 `\makespine`,
兩邊要一起改才不會漂移。
