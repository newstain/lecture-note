# 个人专用模板

## 不同环境中的使用方法

### 建议使用`xelatexmk`进行编译

### WSL中的使用

在WSL中使用时，需链接到windows字体库，如下操作
命令 `sudo /etc/font/local.conf` 新建文件并粘贴如下内容

```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>/mnt/c/Windows/Fonts</dir>
</fontconfig>
```

之后命令行刷新字体文件

```bash
fc-cache -fv
```

可使用

### ArchLinux主机中的使用

需要先在windows上先安装`JetBrains Mono`字体，再安装微软字体([参考链接](https://arch-linux.osrc.com/advanced/optional-cfg-1.html#%E5%AE%89%E8%A3%85-windows-%E5%AD%97%E4%BD%93))，一般情况直接下载即可使用，还不知道有没有什么特殊情况。



## 一些注意事项

### .bib编译

采用分章节引用的模式。

在 `note.tex` 中包含其它子文件时不要把后缀也写上，否则会无法编译文献。应写成如下形式

```
\include{contents/math-base/preparation}    	%正确，不包含文件后缀名
\include{contents/math-base/preparation.tex}	%错误，包含文件后缀
```

