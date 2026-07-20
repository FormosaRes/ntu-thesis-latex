# ☁️ 用 Overleaf 寫論文（零安裝）<br>Using this template on Overleaf

**完全不用在自己電腦安裝 LaTeX。** 瀏覽器打開就能寫、就能編譯出 PDF。
這是給「沒碰過 LaTeX / 不想搞環境」的人最推薦的路線。

[![Open in Overleaf](https://img.shields.io/badge/Open%20in-Overleaf-47A141?logo=overleaf&logoColor=white)](https://www.overleaf.com/docs?snip_uri=https://github.com/FormosaRes/ntu-thesis-latex/archive/refs/heads/main.zip)

---

## 🚀 三步驟開始

### 第 1 步：把範本開進 Overleaf

點上面那顆 **Open in Overleaf** 按鈕。Overleaf 會自動抓取本 repo 的最新版、
建立一個屬於你的專案。（需要先有 Overleaf 帳號，免費方案就夠用。）

> 按鈕背後就是這個網址，你也可以自己貼：
> `https://www.overleaf.com/docs?snip_uri=https://github.com/FormosaRes/ntu-thesis-latex/archive/refs/heads/main.zip`

### 第 2 步：⚠️ 把編譯器改成 XeLaTeX（**最重要的一步**）

**Overleaf 預設是 pdfLaTeX，不改的話中文一定編不出來、畫面會滿江紅。**

```
左上角 Menu ▸ Settings ▸ Compiler ▸ 選 XeLaTeX
```

同一個 Menu 裡順便確認：

```
Main document ▸ 選 main.tex
```

> 本專案有兩個可編譯的進入點（`main.tex` 論文本體、`bookspine.tex` 書背），
> Overleaf 有時會挑錯，指定一下最保險。

### 第 3 步：按 Recompile

右邊會跑出完整的論文 PDF。**到這裡你就可以開始寫了** ——
論文資訊改 `main.tex` 裡的 `\ntusetup{...}` 區塊，內文寫在 `chapters/` 各章。

---

## 🔤 字型：預設就能編，但要不要更準看你

規範 §10 要求**中文 12pt 楷書**。字型在 Overleaf 上分兩種做法：

### 做法 A：什麼都不做（預設，可直接用）

本範本的 class 內建字型 fallback 鏈。Overleaf 伺服器有內建
**`AR PL UKai TW`**（一套繁體楷書），fallback 會自動命中它，
**所以你不做任何事就能編出楷體中文**。

適合：寫作階段、給指導教授看初稿、確認版面。

### 做法 B：上傳標楷體，達到規範字型（送印前建議）

若要精準符合「標楷體」：

1. 在自己的 Windows 電腦找到 `C:\Windows\Fonts\kaiu.ttf`（標楷體）
2. 把 `kaiu.ttf` 拖進 Overleaf 專案的檔案列表
3. 在 `main.tex` 的 `\documentclass{...}` **下面**加一行：

```latex
\documentclass[master,oneside]{ntuthesis}

% ↓ 上傳 kaiu.ttf 後解除註解，即可使用標楷體
\setCJKmainfont[Path=./]{kaiu.ttf}
```

4. Recompile

> ⚖️ **字型授權提醒：** 標楷體隨 Windows／Office 授權，**可以自己用，但不得再散布**。
> 這也是本 repo 不直接附字型檔的原因 —— 請從自己的電腦上傳，
> **不要**把 `kaiu.ttf` commit 進任何公開 repo。

---

## 📖 編譯書背

書背是獨立檔案。要產生書背 PDF：

```
Menu ▸ Settings ▸ Main document ▸ 改選 bookspine.tex ▸ Recompile
```

印完記得**改回 `main.tex`**，否則之後編的都是書背。

---

## 🔧 Overleaf 上的常見狀況

| 症狀 | 原因 | 解法 |
|---|---|---|
| 一大片紅色錯誤、中文完全不出來 | 編譯器還是 pdfLaTeX | Menu ▸ Settings ▸ Compiler ▸ **XeLaTeX** |
| 編出來是書背不是論文 | Main document 選到 `bookspine.tex` | Menu ▸ Settings ▸ Main document ▸ `main.tex` |
| 中文有出來但不是標楷體 | 用到 fallback 字型（正常） | 見上面「做法 B」，或寫作階段直接忽略 |
| 引用變成 `[?]`、參考文獻空白 | bib 需要多跑一輪 | 再按一次 Recompile；仍不行檢查 `back/references.bib` 語法 |
| 交叉參照顯示 `??` | 同上，`.aux` 還沒穩定 | 再 Recompile 一次 |
| `Compile timed out` | 免費方案有編譯時間上限 | 寫作時先只編部分章節（`\includeonly{}`），或改用本機編譯 |
| 圖片放不進去 | 檔案沒上傳或路徑錯 | 圖檔要拖進 `figures/`，`\includegraphics{figures/xxx}` |

---

## 🔄 範本更新了怎麼辦？

Overleaf 專案是你按下按鈕當下的**快照**，不會自動跟著本 repo 更新。
若之後範本修了 bug，你有兩個選擇：

- **只想拿修正**：到 repo 看 [commit 紀錄](https://github.com/FormosaRes/ntu-thesis-latex/commits/main)，
  手動把改動貼進你的 `ntuthesis.cls`
- **重開一個新專案**：再按一次 Open in Overleaf，把你的 `chapters/`、
  `front/`、`back/references.bib` 和 `\ntusetup{...}` 內容搬過去

> 💡 論文寫到一半**不建議**大改 class。定稿前確認版面符合規範即可。

---

## 🖥️ 想改用本機編譯？

Overleaf 適合寫作，但長論文本機編譯更快。裝好 TeX Live（含 XeLaTeX）後：

```bash
latexmk -xelatex main.tex
xelatex bookspine.tex
```

細節見 [README](../README.md) 的「環境需求」與「快速開始」。

---

## 🙋 還是卡住？

開一個 [Issue](https://github.com/FormosaRes/ntu-thesis-latex/issues)，
**附上 Overleaf 的錯誤訊息**（Logs and output files ▸ Raw logs），
這樣才看得出是哪裡出問題。
