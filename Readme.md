# Multithreading (Doing more than 1 thing at a time)

## Concurrency & Parallelism

![](https://www.raywenderlich.com/148513/grand-central-dispatch-tutorial-swift-3-part-1)

* Concurrency: Being able to do more than one thing at 
* Parallelism: is having the resources to actually do more than 1 thing at a time.

## What are threads?

```
var thread = Thread()
thread.dosomething {

}
```

## Issues with Multithreading

* Creating too many threads could lead to poor performance.
* if we put a task on a different thread, we may not know when the task completes, so extra effort has to be taken to synchronize our code.
* we have to manage dependencies better.
* it's more complicated

## Benefits of Multithreading

* run multiple things at the same time which can be much quicker, because you don't have to wait around for something to finish. HTTP request.

---

[Ray](https://www.raywenderlich.com/148513/grand-central-dispatch-tutorial-swift-3-part-1)
[Swift](https://swift.org/core-libraries/#foundation)

## Coding with threads

* `Grand Central Dispatch` (GCD) is a C library. written by apple and nicely bridged to Swift. should be fast because it's C. C is compatible with pretty much everything.
* `NSOperation` is a objective-c framework. `NS`. We should assume it's Object Orient. it's an apple framework. Uses GCD under the hood.
* `NSThread`  is a objective-c framework.
* POSIX threads

## GCD 

### Queues

* The main queue -> the main thread.
* global queues that run on other threads. These already exist because they're created by the os and our app has access to them.
* custom queues that we can create. 

### Serial vs. Concurrent

* serial: the next thing in the queue can't start until the previous thing finishes.
* concurrent: things will start in FIFO order, things don't have to wait for the previous thing to finish.

### Synchronous vs. Asynchronous


* sync will block the current execution
* async won't 

* sync, async, asyncAfter

### Dispatch Groups

* Use dispatch groups to create more thread safe environments by "locking" a resource.

---

## Links

https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Multithreading/Introduction/Introduction.html

## Snippets


```queues
let mainQueue = DispatchQueue.main
let globalQueue = DispatchQueue.global(qos: .default)
let customQueue = DispatchQueue(label: "com.meech-ward.doSomething", qos: .default, attributes: [.concurrent])
```

```
globalQueue.asyncAfter(deadline: .now() + 2) {
    print("🤗 4")
}
```


`RunLoop.main.run(until: Date(timeIntervalSinceNow: 100))`

```
func addItem(string: String) {
    arrayQueue.async {
        _array.append(string)
    }
}

var array: [String] {
    var a: [String] = []
    arrayQueue.sync {
        a = _array
    }
    return a
}
```

```
group.notify(queue: queue) {
    DispatchQueue.main.async {
        print("photo likes: \(photo.getLikes())")
    }
}
```


```
let queue = DispatchQueue.global(qos: .default)
let queue = DispatchQueue(label: "", qos: .default, attributes: [.concurrent])
queue.async(flags: .barrier)
```

```
func process() {
    let random = arc4random_uniform(2)+2
    sleep(random)
}
```