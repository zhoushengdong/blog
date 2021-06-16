---
title: 浏览器原生JS-Base64编码解码
date: 2016-8-8 18:02:35
tags: JavaScript
categories: JavaScript
top: 3
---

## 原生atob和btoa方法

实际上，从IE10+浏览器开始，所有浏览器就原生提供了Base64编码解码方法，不仅可以用于浏览器环境，Service Worker环境也可以使用。

方法名就是`atob`和`btoa`，具体语法如下：
<!-- more -->

## Base64解码
   语法为（浏览器中）：

```JavaScript
var decodedData = window.atob(encodedData);
```

或者（浏览器或[js Worker线程中](https://developer.mozilla.org/zh-CN/docs/Web/API/Worker/Worker)）：

```JS
var decodedData = self.atob(encodedData);
```

例如：

    window.atob('RERE');
    // 返回：'DDD'

**记住atob**
`atob`这个方法名称乍一看，很奇怪，不知道这个单词什么意思。我们可以理解为 A to B，也就是从A到B。这里的B指的就是Base64吗？猜错了！A指的才是Base64，反的，A才是Base64，和首字母对应关系是反的。

因此，atob表示Base64字符to普通字符，也就是Base64解码。

##  Base64编码

语法为（浏览器中）：
```JS
var encodedData = window.btoa(stringToEncode);
```


或者（浏览器或[js Worker线程中](https://developer.mozilla.org/zh-CN/docs/Web/API/Worker/Worker)）：

```JS
var encodedData = self.btoa(stringToEncode);
```


例如：
```JS
window.btoa('DDD');
// 返回：'RERE'
```

**记住btoa方法**
`btoa`这个方法名称乍一看，很奇怪，不知道这个单词什么意思。我们可以理解为 B to A，也就是从B到A。那B指什么，A指什么呢？和`atob`方法一样，B指的是普通字符串，A指的是Base64字符。

因此，`btoa`方法表示普通字符to Base64字符，也就是Base64编码。

## IE8/IE9的polyfill
当下，仍有不少PC项目还需要兼容IE9，所以，我们可以专门针对这些浏览器再引入一段ployfill脚本或者一个JS文件即可。
ployfill [JS脚本戳这里](https://github.com/davidchambers/Base64.js/blob/master/base64.js)，或者直接[右键这里](https://www.zhangxinxu.com/study/201808/base64-polyfill.js)下载源文件！
实际使用，我们可以借助IE条件注释无缝对接。

也就是HTML中嵌入下面一段代码：
```JS
<!--[if IE]>
<script src="./base64-polyfill.js"></script>
<![endif]-->
```
`[if IE]`表示所有IE浏览器，由于IE10+浏览器已经放弃了著名的IE条件注释的支持，Chrome等浏览器本身就不支持这个IE私有语法，因此，很天然的，上面一段script引入只在IE9-浏览器下有效。而我们本来就希望只IE8，IE9浏览器引入ployfill，于是正好完美衔接上。

也就是原生支持atob和btoa方法的浏览器认为就是一段无需关心的HTML注释，不支持atob和btoa的IE9及其以下浏览器则会加载我们的base64-polyfill.js，使浏览器也支持`window.btoa`和`window.atob`这个语法。
