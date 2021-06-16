---
title: JavaScript 闭包
date: 2015-12-22 09:21:00
tags: JavaScript
categories: JavaScript
---

> 闭包（closure）是Javascript语言的一个难点，也是它的特色，很多高级应用都要依靠闭包实现。

## 变量的作用域

- 要理解闭包首先必须理解JS变量的作用域，无非就是两种：全局变量和局部变量

```
var b = 123;
function fn(){
　　alert(b);
}
fn(); // 123
```

> 我的理解是，闭包就是能够读取其他函数内部变量的函数
