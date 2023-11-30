# 个人专用模板

## 不同环境中的使用方法

### 建议使用`xelatexmk`进行编译

### Windows还没有测试过

### WSL中的使用

在WSL中使用时，先在windows上先安装`JetBrains Mono`字体，然后链接到windows字体库，操作如下
命令行输入 `sudo /etc/font/local.conf` 新建文件，并粘贴如下内容

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>/mnt/c/Windows/Fonts</dir>
</fontconfig>
```

保存文件后命令行刷新字体文件

```bash
fc-cache -fv
```

### ArchLinux主机中的使用

需要先在windows上先安装`JetBrains Mono`字体，再安装微软字体([参考链接](https://arch-linux.osrc.com/advanced/optional-cfg-1.html#%E5%AE%89%E8%A3%85-windows-%E5%AD%97%E4%BD%93))，一般情况直接下载即可使用，还不知道有没有什么特殊情况。

## 一些使用规则

### 一些环境

#### `definition`, `theorem`, `question` 环境

自带计数器（对每个环境进行个数统计及显示）

```tex
%%%% 定义环境的使用
\begin{definition}[定义名称]
   ******
\end{definition}

%%%% 定理环境的使用
\begin{theorem}[定义名称]
   ******
\end{theorem}

%%%% 问题环境的使用
\begin{question}[问题的描述]
   ******
\end{question}
```

#### `note`, `example`, `proof` 环境

没有计数器的环境

```tex
%%%% note 环境
\begin{note}
   ******
\end{note}

%%% example与proof环境使用同上，把名称note替换为对应的关键字
```

### 数学环境

#### Dirac符号

包含了宏包`\RequirePackage{braket}`来使用Dirac符号，具体用法如下

```tex
% 大写开头的命令可随公式大小变动
\Braket{A | Q | B}
\Braket{A || Q || B}
\Bra{A}
\Ket{B}

% 小写开头的命令不随公式大小变动
\braket{A | Q | B}
\braket{A || Q || B}
\bra{A}
\ket{B}
```

### 代码环境

#### c++风格

仅使用了c++风格的代码环境，使用了[`JetBrains Mono`](https://www.jetbrains.com/lp/mono/)字体。使用方法

```tex
%%%               代码风格            指向代码所在的文件(相对路径)
\lstinputlisting[style=styleC]{contents/Appendix/code/cubic-integration.cpp}
```

## 一些注意事项

### .bib编译

**采用分章节引用的模式**

在 `note.tex` 中包含其它子文件时不要把后缀也写上，否则会无法编译文献。应写成如下形式

```
\include{contents/math-base/preparation}    	%正确，不包含文件后缀名
\include{contents/math-base/preparation.tex}	%错误，包含文件后缀
```

再每个章节(记住是每个章节)的最后需要都加上

```tex
\bibliographystyle{modified-apsrev4-2}  %% 这个是网上下载的文献格式，可替换为其它，我把里面的标题从灰色改到了黑色
\bibliography{reference}
```

我自己用的文献格式`modified-apsrev4-2`从[这里下载](https://github.com/fbuessen/revtex-bst-modified/tree/master)，把里面的`modified-apsrev4-2.bst`放到和`note.tex`相同的目录中。

**.bib文件中不要包含`lang`选项**

```tex
@article{bertsch_angular_2019,
	title = {Angular momentum of fission fragments},
	volume = {99},
	issn = {2469-9985, 2469-9993},
	url = {https://link.aps.org/doi/10.1103/PhysRevC.99.034603},
	doi = {10.1103/PhysRevC.99.034603},
	number = {3},
	urldate = {2023-08-28},
	journal = {Physical Review C},
	author = {Bertsch, G. F. and Kawano, T. and Robledo, L. M.},
	month = mar,
	year = {2019},
	keywords = {notion},
	pages = {034603}
	%%%%%%%%%%%%%%%%
	lang = {en}   % 错误，不要添加这一项
}
```
