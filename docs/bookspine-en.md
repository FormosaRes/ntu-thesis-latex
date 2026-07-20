# 📏 How to Make the Book Spine<br>書背（側邊）怎麼做（English）

The spine (書背 / 側邊) is the strip of text printed on the **side** of your bound thesis.
The guidelines specify what goes on it, but not **how wide it should be** or **how to
produce the file** — this page covers both.
中文版：[bookspine.md](bookspine.md)

---

## 👀 What it looks like

<img src="img/preview-spine-flat.png" width="100%" alt="Book spine example (rotated for readability)">

<sub>↑ Rotated here for readability; on the bound volume it runs vertically, read top to bottom.</sub>

---

## 📋 What goes on it (§2)

From top to bottom:

| Order | Content | Example |
|---|---|---|
| 1 | University name | 國立臺灣大學 |
| 2 | Department / institute / degree program | 地質科學系 |
| 3 | Degree | 碩士論文 |
| 4 | **Thesis title in Chinese** | ○○○○○○ |
| 5 | Author name | 王小明 撰 |
| 6 | Date submitted (ROC year) | 中華民國一一五年七月 |

> ⚠️ The spine carries the **Chinese** title only — not the English title.
> This applies even if your thesis is written in English.

---

## 📐 Determining the width (where most people get stuck)

**Spine width = the thickness of your bound thesis.** There is no standard value — it
depends on your page count, paper weight, single- or double-sided printing, and whether
you choose paperback or hardcover.

### Estimating

With the required A4 **80 gsm** woodfree interior paper, each sheet is roughly **0.1 mm**:

```
spine width ≈ number of sheets × 0.1 mm + cover thickness
```

| Case | Sheets | Estimated thickness |
|---|---|---|
| 100 pages, double-sided | 50 | about 5 mm |
| 150 pages, double-sided | 75 | about 8 mm |
| 200 pages, double-sided | 100 | about 10 mm |
| 100 pages, single-sided | 100 | about 10 mm |

Add roughly **0.5–1 mm** for a paperback cover (200 gsm art card). Hardcovers are thicker
and are normally **measured by the bindery**.

### ✅ The reliable approach

**Print the interior first, take it to the bindery, and have them measure the thickness**,
then build the spine to that number. Many print shops in Taiwan offer this as a matter of
course and will often typeset the spine for you — **ask before you print; it can save you
from paying for a second run.**

> 💡 Title too long? The LaTeX version of this template **shrinks the type automatically**
> to fit the spine height, without clipping. In the Word version you adjust the size yourself.

---

## 🛠️ Three ways to produce it

### Option 1: Word (no LaTeX)

📥 **Download → [`ntu-bookspine.docx`](../word/ntu-bookspine.docx)**

1. Open in Word and replace the text inside `【】` with your own
2. Adjust the **table column width** to your measured thickness (the template's 3 cm is
   only a placeholder)
3. **Delete the grey border before printing** — it only marks the spine area

Best for: people who need the spine alone and do not want to touch LaTeX.

### Option 2: LaTeX (this template)

The spine is a separate file and compiles on its own:

```bash
xelatex bookspine.tex        # produces bookspine.pdf
```

It pulls your thesis details straight from the `\ntusetup{...}` block in `main.tex`, so
there is nothing to retype. To change the spine height, edit `\spineheight` (default 25 cm):

```latex
\setlength{\spineheight}{25cm}
```

On Overleaf: `Menu ▸ Settings ▸ Main document ▸ bookspine.tex` (switch it back to
`main.tex` afterwards) → see [overleaf.md](overleaf.md).

### Option 3: Let the bindery do it

Hand the print shop your title, name, department, and date — most will typeset the spine
for you. For **hardcovers (master's red / doctoral black, gold foil)** the lettering has to
be stamped by the bindery anyway, and the spine is usually handled at the same time.

---

## ⚠️ Pre-print checklist

```
□ Spine width is measured, not guessed
□ All six items present (university / department / degree / Chinese title / name / date)
□ Chinese title only — no English title
□ Placeholder border deleted
□ Vertical orientation correct (reads top to bottom)
□ Hardcover: gold-foil colour confirmed with the bindery
  (master's = red, doctoral = black)
```

---

## 🔗 Related

- [Format requirements](format-spec-en.md) — everything NTU requires
- [Word templates for cover and spine](../word/) — download and fill in
- [Graduation checklist](graduation-checklist-en.md) — what happens after printing
- [Formatting Guidelines, official full text](https://www.lib.ntu.edu.tw/doc/cl/THESISSAMPLE.doc)
