---
layout: post
title: "RxJava源码解析（－）创建Observable"
date: "2015-10-10"
---
RxJava 最近变得越来越流行，如果你还不知道什么是RxJava的话，可以看一下这个系列的文章[Dan.lew *RxJava系列](http://blog.danlew.net/2014/09/15/grokking-rxjava-part-1/)。  
我花了点时间分析了一下RxJava的源码，非常庞大，非常强大，所以决定一点一点来分析。这篇文章主要分析了创建Observable的源代码，以及创建Observable以后，Subscriber subscribe之后的执行流程。

##  创建Observable
通常我们创建Observable的时候，会使用一下三种方法：
Observable.create(OnSubscriber onSubscriber); 如：
```Java
        Observable<String> observable = Observable.create(new OnSubscribe<String>() {
            @Override
            public void call(Subscriber<? super String> subscriber) {
                String result = getResult();
                subscriber.onNext(result);
                subscriber.onCompleted();
            }
        });
```
其中OnSubscriber是Observable的一个内部接口：
```Java
    /**
     * Invoked when Observable.subscribe is called.
     */
    public interface OnSubscribe<T> extends Action1<Subscriber<? super T>> {
        // cover for generics insanity
    }
```
可见`OnSubscribe`继承自`Action1`接口，
## Create Observable
create, just, from
subscribe
unsubscribe

OnSubscribe
	- call(Subscriber)
create(OnSubscribe)  -> new Observable(OnSubscribe)
from(Iterable) -> create(OnSubscribeFromIterable)
just(value) -> new ScalarSynchronousObservable(value)
just(value1, value2) -> from(Iterable) -> create(OnSubscribeFromIterable)    OnSubscribeFromIterable < OnSubscribe

所有的创建Observable的方法都将最终调用到

## Operators
map
flatmap
filter
first
lift

## Thread
subscribeOn
observeOn

## Error handling
onError
