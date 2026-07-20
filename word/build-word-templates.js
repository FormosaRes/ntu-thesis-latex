const {
  Document, Packer, Paragraph, TextRun, AlignmentType,
  Table, TableRow, TableCell, WidthType, TextDirection,
  VerticalAlign, BorderStyle,
} = require('docx');
const fs = require('fs');

// 1 cm = 566.93 DXA ; 1 pt = 20 twips ; size = half-points
const CM = (n) => Math.round(n * 566.93);
const KAI = { ascii: 'DFKai-SB', eastAsia: '標楷體', hAnsi: 'DFKai-SB' };
const TNR = { ascii: 'Times New Roman', eastAsia: '標楷體', hAnsi: 'Times New Roman' };

// centred line; pt = font size in points, lead = leading in points
const line = (text, font, pt, lead, opts = {}) =>
  new Paragraph({
    alignment: AlignmentType.CENTER,
    spacing: { line: lead * 20, lineRule: 'atLeast', before: (opts.before || 0) * 20, after: (opts.after || 0) * 20 },
    children: [new TextRun({ text, font, size: pt * 2 })],
  });

const gap = (pts) => new Paragraph({ spacing: { before: 0, after: 0, line: pts * 20, lineRule: 'exact' }, children: [] });

// ─── 封面 (附件1) ─────────────────────────────────────────────────────────────
// 規範 §10 版面：上 4cm、下 3cm、左右各 3cm，全部置中。
// 級數依附件1：校名/系所行 18pt 楷、deptEN/collegeEN 14pt、NTU/學位 16pt、
// 題目/姓名/指導教授/日期 18pt。
const cover = new Document({
  creator: 'ntu-thesis-latex',
  title: '國立臺灣大學論文封面範本',
  sections: [{
    properties: {
      page: { margin: { top: CM(4), bottom: CM(3), left: CM(3), right: CM(3) } },
    },
    children: [
      line('國立臺灣大學【○○學院】【○○學系／研究所】', KAI, 18, 27),
      line('【碩士論文】', KAI, 18, 27, { after: 6 }),

      line('【Department of ○○】', TNR, 14, 21),
      line('【College of ○○】', TNR, 14, 21),
      line('National Taiwan University', TNR, 16, 24),
      line("【Master's Thesis】", TNR, 16, 24),

      gap(56),

      line('【中文論文題目】', KAI, 18, 27, { after: 10 }),
      line('【English Thesis Title】', TNR, 18, 27),

      gap(56),

      line('【姓名】', KAI, 18, 27),
      line('【Name in English】', TNR, 18, 27),

      gap(56),

      line('指導教授：【姓名】 博士', KAI, 18, 27),
      line('Advisor: 【Name】, Ph.D.', TNR, 18, 27),

      gap(56),

      line('中華民國【一一五】年【七】月', KAI, 18, 27),
      line('【July 2026】', TNR, 18, 27),
    ],
  }],
});

// ─── 書背／側邊 (§2) ──────────────────────────────────────────────────────────
// 校名、系所、學位、論文中文題目、撰者姓名、提出年月，直式。
// 作法：單格表格 + textDirection 旋轉 90°（與 LaTeX 版 \rotatebox{-90} 同向）。
const spineText = '國立臺灣大學 【○○學系】 【碩士論文】    【中文論文題目】    【姓名】 撰    中華民國【一一五】年【七】月';

const spine = new Document({
  creator: 'ntu-thesis-latex',
  title: '國立臺灣大學論文書背範本',
  sections: [{
    properties: {
      page: { margin: { top: CM(1), bottom: CM(1), left: CM(1), right: CM(1) } },
    },
    children: [
      new Table({
        alignment: AlignmentType.CENTER,
        columnWidths: [CM(3)],
        rows: [new TableRow({
          height: { value: CM(25), rule: 'atLeast' },   // 書背高度 25cm
          children: [new TableCell({
            width: { size: CM(3), type: WidthType.DXA },
            textDirection: TextDirection.TOP_TO_BOTTOM_RIGHT_TO_LEFT,
            verticalAlign: VerticalAlign.CENTER,
            borders: {
              top:    { style: BorderStyle.SINGLE, size: 4, color: 'BFBFBF' },
              bottom: { style: BorderStyle.SINGLE, size: 4, color: 'BFBFBF' },
              left:   { style: BorderStyle.SINGLE, size: 4, color: 'BFBFBF' },
              right:  { style: BorderStyle.SINGLE, size: 4, color: 'BFBFBF' },
            },
            children: [new Paragraph({
              alignment: AlignmentType.CENTER,
              children: [new TextRun({ text: spineText, font: KAI, size: 12 * 2 })],
            })],
          })],
        })],
      }),
      new Paragraph({
        alignment: AlignmentType.CENTER,
        spacing: { before: 240 },
        children: [new TextRun({
          text: '※ 上方灰框僅示意書背範圍，印刷前請刪除框線。書背寬度依論文裝訂後厚度調整。',
          font: KAI, size: 10 * 2, color: '808080',
        })],
      }),
    ],
  }],
});

(async () => {
  fs.writeFileSync('封面-cover.docx', await Packer.toBuffer(cover));
  fs.writeFileSync('書背-bookspine.docx', await Packer.toBuffer(spine));
  console.log('written');
})();
