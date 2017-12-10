---
title: JavaScript 中 this 的详解
date: 2017-12-10 21:12:06
tags:
---

## this 的指向
- this 是 JS 中定义的关键字，它自动定义于每一个函数域内，但是它的指向却让人很迷惑。
- 在实际应用中，this 的指向大致可以分为以下四种情况。

### 1.作为普通函数调用
- 当函数作为一个普通函数被调用，this 指向全局对象。在浏览器里，全局对象就是 window。

```
window.name = 'denton';
function getName(){
    console.log(this.name);
}
getName(); // denton
```

- 可以看出，此时 this 指向了全局对象 window。 在ECMAScript5的严格模式下，这种情况 this 已经被规定不会指向全局对象了，而是 undefined。
<!-- more -->
```
'use strict';
function fun(){
    console.log(this);
}
fun(); // undefined
```

### 2.作为对象的方法调用

- 当函数作为一个对象里的方法被调用，this 指向该对象

```
var obj = {
    name : 'denton',
    getName : function(){
        console.log(this.name);
    }
}

obj.getName(); // denton
```

- 如果把对象的方法赋值给一个变量，再调用这个变量：

```
var obj = {
    fun1 : function(){
        console.log(this);
    }
}
var fun2 = obj.fun1;

fun2(); // window
```

- 此时调用 fun2 方法 输出了 window 对象，说明此时 this 指向了全局对象。给 fun2 赋值，其实是相当于：

```
var fun2 = function(){
    console.log(this);
}
```

- 可以看出，此时的 this 已经跟 obj 没有任何关系了。这时 fun2 是作为普通函数调用。

### 3.作为构造函数调用

JS中没有类，但是可以从构造器中创建对象，并提供了 new 运算符来进行调用该构造器。构造器的外表跟普通函数一样，大部分的函数都可以当做构造器使用。当构造函数被调用时，this 指向了该构造函数实例化出来的对象。

```
var Person = function(){
    this.name = 'denton';
}
var obj = new Person();
console.log(obj.name); // denton
```

- 如果构造函数显式的返回一个对象，那么 this 则会指向该对象。

```
var Person = function(){
    this.name = 'DDD';
    return {
        name : 'denton'
    }
}
var obj = new Person();
console.log(obj.name); // denton
```

- 如果该函数不用 new 调用，当作普通函数执行，那么 this 依然指向全局对象。

### 4.call() 或 apply() 调用

- 通过调用函数的 call() 或 apply() 方法可动态的改变 this 的指向。

```
var obj1 = {
    name : 'denton',
    getName : function(){
        console.log(this.name);
    }
}
var obj2 = {
    name : 'DDD'
}

obj1.getName();             // denton
obj1.getName.call(obj2);    // DDD
obj1.getName.apply(obj2);   // DDD
```
这两个方法在js中都是非常常用的方法，可以阅读下一篇：javascript 中 apply 、call 的详解。
