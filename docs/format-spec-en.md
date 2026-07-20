# 📐 NTU Thesis Format Requirements<br>臺大論文格式規範速查（English）

**Everything NTU requires, on one page.** No LaTeX knowledge needed, nothing to download.
中文版：[format-spec.md](format-spec.md)

> 📌 Based on the *Formatting Guidelines for Master's and Doctoral Theses,
> National Taiwan University* (adopted 1996-09-22; **amended 2023-10-20 / ROC 112.10.20**,
> approved by the Academic Affairs Council). **Last verified: 2026-07-20.**
> Official full text (Word): [**THESISSAMPLE.doc**](https://www.lib.ntu.edu.tw/doc/cl/THESISSAMPLE.doc)
> ｜ Submission rules: [NTU Library](https://www.lib.ntu.edu.tw/node/103)
>
> ⚠️ This is an **unofficial** summary. Where it conflicts with the official document,
> **the official document governs**.

> 🇹🇼 **Note:** the cover, spine, and abstract must include **Chinese** text even if your
> thesis is written in English (see below). Your department's graduate secretary
> (系所助教) is the best contact for department-specific rules.

---

## 👀 What the cover looks like

<img src="img/preview-cover.png" width="380" alt="Cover example">

All lines **centred**, top margin 4 cm. Sizes from top to bottom:

| Line | Content | Size | Font |
|---|---|---|---|
| 1 | 國立臺灣大學 + College + Department (Chinese) | 18 pt | Kai (楷書) |
| 2 | 碩士論文 / 博士論文 (Master's / Doctoral) | 18 pt | Kai |
| 3 | Department of ○○ | 14 pt | Times New Roman |
| 4 | College of ○○ | 14 pt | Times New Roman |
| 5 | National Taiwan University | 16 pt | Times New Roman |
| 6 | Master's Thesis / Doctoral Dissertation | 16 pt | Times New Roman |
| 7 | Thesis title in **Chinese** | 18 pt | Kai |
| 8 | Thesis title in English | 18 pt | Times New Roman |
| 9 | Author name (Chinese / English) | 18 pt | Kai / Times |
| 10 | Advisor (Chinese / English) | 18 pt | Kai / Times |
| 11 | Date submitted (ROC year / Western) | 18 pt | Kai / Times |

The **title page** (second page) is identical in content to the cover.

📥 Ready to use → [Word cover template](../word/ntu-cover.docx) ｜ [LaTeX version](../main.tex)

---

## 📏 What the spine looks like

The spine (側邊) must carry: **university name, department, degree, Chinese thesis title,
author name, and date of submission**.

<img src="img/preview-spine-flat.png" width="100%" alt="Book spine example (rotated for readability)">

<sub>↑ Rotated here for readability; on the bound volume it runs vertically.</sub>

📖 **Full guide to making the spine (including how to determine its width) →
[bookspine-en.md](bookspine-en.md)**

---

## 📑 Required order of sections

Bind in exactly this order:

```
Cover (including spine)
Title page (same content as cover)
Oral examination committee certification
Preface or acknowledgements    ← optional
Chinese abstract + 5–7 keywords
English abstract + 5–7 keywords
Table of contents
List of figures
List of tables
Main text
References
Appendix
Back cover
```

---

## 🖨️ Layout and fonts (§10)

| Item | Requirement |
|---|---|
| Margins (main text) | Top 3 cm, bottom 2 cm, **left and right 3 cm each** |
| Chinese font | **12 pt Kai (楷書)** — 細明體 and 標楷體 are the primary faces |
| English font | **12 pt Times New Roman** |
| Chinese line spacing | **1.5** |
| English line spacing | **Double** |
| Page numbers | **Bottom centre** of every page |
| Text colour | Black; no smudging or deletions; no carbon paper |

> The **cover** uses a 4 cm top margin — different from the 3 cm used in the main text.

---

## 📝 Requirements for each part

| Part | Requirement |
|---|---|
| Acknowledgements | Must start on a new page; concise, **one page as a rule** |
| Chinese abstract | **Max 3 pages**; must cover the main argument, methods or procedures, results and discussion, and conclusions |
| English abstract | **Max 3 pages** |
| Keywords | **5–7** in both Chinese and English |
| Table of contents | Chapter and section headings, appendices, and page numbers |
| Lists of figures / tables | Figures and tables with page numbers; **sources must be cited if taken from references** |
| References | Must include author surname, year of publication, technical report or journal name, and page numbers |

> ⚠️ Students approved to write the thesis in English **must still include a Chinese abstract.**

---

## 📚 Printing and binding (§11–12)

| Item | Requirement |
|---|---|
| Printing | **Double-sided as a rule**; single-sided permitted at 80 pages or fewer (colour figures may also be single-sided) |
| Interior paper | White A4, **80 gsm** woodfree paper |
| Paperback cover | Light-coloured **200 gsm** C1S art card or coloured cardstock (gloss laminated), A4 |
| Hardcover | **Master's: red with gold foil lettering; Doctoral: black with gold foil lettering**, A4 |

Paperback or hardcover — **either is acceptable**.

---

## 📦 How many printed copies

| Department | Copies | Submit to |
|---|---|---|
| Most departments | **2** | Main Library |
| Mathematics, Physics, Chemistry, Oceanography, College of Social Sciences, College of Law | **3** | Main Library |
| College of Medicine, College of Public Health | **2** | Medical Library |

> ⚠️ **This table mixes two levels.** The first four are **individually named departments**;
> only the last two are **entire colleges**. Do not infer "the whole College of Science
> needs 3" — other departments in that college (Geosciences, Psychology, Atmospheric
> Sciences, etc.) are **not named and fall under the general 2-copy rule**.
> The count **includes 1 copy forwarded to the National Central Library**.

🎓 Full submission and graduation process → [graduation-checklist-en.md](graduation-checklist-en.md)

---

## ⚖️ Departments may add their own rules (§13)

> Each department, institute, or degree program may establish its own uniform format
> reflecting the particular nature of its field, **provided the overall structure follows
> these guidelines.**

In practice: **follow the university rules for the overall layout, and ask your department
for the details.**

---

## 🔗 Official links

- [Formatting Guidelines, full text (Word)](https://www.lib.ntu.edu.tw/doc/cl/THESISSAMPLE.doc)
- [NTU Library — Thesis Submission & Graduation Procedures](https://www.lib.ntu.edu.tw/node/103)
- [OAA — Degree Examination Process](https://www.aca.ntu.edu.tw/w/aca/GAADService_21071211480338254)

Spotted a rule change? Please open an
[Issue](https://github.com/FormosaRes/ntu-thesis-latex/issues) — **include the official link**.
