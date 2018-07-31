## Index Description file
## 基于 Hexo 构建一个博客
[在线地址](https://zhoushengdong.github.io/)

[官方文档](https://hexo.io/zh-cn/docs/)

## 发布
hexo g -d

## 新建一篇文章 new
```
$ hexo new [layout] <title>
```
新建一篇文章。如果没有设置 layout 的话，默认使用 _config.yml 中的 default_layout 参数代替。如果标题包含空格的话，请使用引号括起来。

## clean
```
$ hexo clean
```
清除缓存文件 (db.json) 和已生成的静态文件 (public)。

在某些情况（尤其是更换主题后），如果发现您对站点的更改无论如何也不生效，您可能需要运行该命令。

## list
```
$ hexo list <type>
```
列出网站资料。

<!-- > 音乐播放器添加在\themes\Next\layout\_macro\sidebar.swig => 162l -->