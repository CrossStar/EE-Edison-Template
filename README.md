# 浙江大学电气工程学院爱迪生班科研训练 $\LaTeX$ 模板

## 简介
这是一个为浙江大学电气工程学院爱迪生班科研训练设计的 $\LaTeX$ 模板，旨在提供一个简洁、易用的文档编写环境。

本项目的文件结构如下：

```
.
│  edison_template.cls
│  main.pdf
│  main.tex
│  README.md
│
├─contents（用于分章节编写文档内容）
│      abstract.tex
│      appendix.tex
│      chapter-1.tex
│      introduction.tex
│
├─figures（用于存储文中使用的图像）
│      test.jpg
│
├─images（用于存储首页的图像，一般情况下不需修改）
│      zju-heading.png
│      zju.png
│
└─references（用于存储参考文献使用的 bib 文件）
        ref.bib
```

## 使用方法
1. 使用如下命令克隆本仓库到本地。
```bash
git clone https://github.com/CrossStar/EE-Edison-Template
```

2. 确保你已经安装了 $\LaTeX$ 发行版（如 TeX Live 或 MikTeX）。
3. 在 `main.tex` 文件中填写必要的信息，并在 `contents/` 文件夹下分章节编写内容。
4. 使用恰当的 $\LaTeX$ 编辑器（如 VSCode，TeXStudio 或者 Overleaf）编译 `main.tex` 文件得到完整的文档。

**注意：**

1. 本模板使用了 `subfiles` 宏包，这意味着你可以选择直接编译 `contents/` 文件夹下的子文件，在很多情况下这有助于提高编译效率。
2. 确保在编译时使用 XeLaTeX，推荐使用 TeXLive 中自带的 latexmk 来进行增量编译
3. 推荐将所有输出文件统一输出到 `.outputs/` 文件夹下，如果你使用的是 VSCode 编辑器，那么可以在 `settings.json` 中通过如下配置来实现：

```json
{
    "latex-workshop.latex.outDir": ".output",
    "latex-workshop.latex.tools": {
      "name": "XeLaTeXmk",
      "command": "latexmk",
      "args": [
        "-output-directory=.output",
        "-xelatex",
        "-synctex=1",
        "-shell-escape",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ]
    },
    "latex-workshop.latex.recipes": [
        {
            "name": "XeLaTeXmk",
            "tools": ["XeLaTeXmk"]
        }
    ]
}
```