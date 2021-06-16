---
title: JS获取服务器端时间
date: 2015-12-10 20:08:06
tags: JavaScript
categories: JavaScript
top: 3
---

##### 用JS做时间校正，获取本机时间，是存在bug的。 使用JS也可获取到服务器时间，原理是使用 Ajax请求，返回的头部信息就含有服务器端的时间信息，获取到就可以了。以下：

> 依赖于JQuery

```
function getServerDate(){
    return new Date($.ajax({async: false}).getResponseHeader("Date"));
}
```
<!-- more -->
以上函数返回的就是一个Date对象，注意在使用ajax时必须同步，要不然无法返回时间日期。

无需填写请求链接；

如果服务器时间和本地时间有时差，需要做校正。

> 原生方法

```
function getServerDate(){
    var xhr = null;
    if(window.XMLHttpRequest){
      xhr = new window.XMLHttpRequest();
    }else{ // IE
      xhr = new ActiveObject("Microsoft")
    }

    xhr.open("GET","/",false) // false不可变
    xhr.send(null);
    var date = xhr.getResponseHeader("Date");
    return new Date(date);
}
```
同样返回的是一个Date对象，<font color=#F08080>xhr.open()必须使用同步;</font>

无需填写请求链接;open，send，和getResponseHeader 必须按序编写。

如需使用异步请求，可监听onreadystatechange状态来做不同的操作。

代码如下：
```
function getServerDate(){
    var xhr = null;
    if(window.XMLHttpRequest){
      xhr = new window.XMLHttpRequest();
    }else{ // ie
      xhr = new ActiveObject("Microsoft")
    }

    xhr.open("GET","/",true);
    xhr.send(null);
    xhr.onreadystatechange=function(){
        var time,date;
        if(xhr.readyState == 2){
            time = xhr.getResponseHeader("Date");
            date = new Date(time);
            console.log(date);
        }
    }
}
```
使用异步不是很方便返回时间。

这里的readyState有四种状态，方便做不同处理：

- 0: 请求未初始化 
- 1: 服务器连接已建立
- 2: 请求已接收
- 3: 请求处理中 
- 4: 请求已完成，且响应已就绪 失败状态，status的值：
    - 200: “OK”
    - 404: 未找到页面