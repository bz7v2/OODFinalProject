# Memory management
## Java
In Java, Memory management is the process of allocating new objects and removing unused objects to make space for those new object allocations.

### The Heap and the Nursery
Java objects reside in an area called the heap. The heap is created when the JVM starts up and may increase or decrease in size while the application runs. When the heap becomes full, garbage is collected. During the garbage collection objects that are no longer used are cleared, thus making space for new objects.

The heap is sometimes divided into two areas (or generations) called the nursery (or young space) and the old space. The nursery is a part of the heap reserved for allocation of new objects. When the nursery becomes full, garbage is collected by running a special young collection, where all objects that have lived long enough in the nursery are promoted (moved) to the old space, thus freeing up the nursery for more object allocation. When the old space becomes full garbage is collected there, a process called an old collection.

### Garbage Collection
Java handles memory by garbage collection. It is called *mark and sweep garbage collection model*.

#### Mark Phase
During the mark phase all objects that are reachable from Java threads, native handles and other root sources are marked as alive, as well as the objects that are reachable from these objects and so forth. This process identifies and marks all objects that are still used, and the rest can be considered garbage.

#### Sweep phase
During the sweep phase the heap is traversed to find the gaps between the live objects. These gaps are recorded in a free list and are made available for new object allocation.

### Types of Garbage Collection
* concurrent mark and sweep strategy
* Parallel Mark and Sweep

#### concurrent mark and sweep strategy
This type of garbage collection allows Java threads continue working during it. The threads need to be stopped for a little
bit for synchronization.

The marking has 4 small phases:
1. Initial marking, where the root set of live objects is identified. This is done while the Java threads are paused.
2. Concurrent marking, where the references from the root set are followed in order to find and mark the rest of the live objects in the heap. This is done while the Java threads are running.
3. Precleaning, where changes in the heap during the concurrent mark phase are identified and any additional live objects are found and marked. This is done while the Java threads are running.
4. Final marking, where changes during the precleaning phase are identified and any additional live objects are found and marked. This is done while the Java threads are paused.

The sweeping also has 4 small phases:
1. Sweeping of one half of the heap. This is done while the Java threads are running and are allowed to allocate objects in the part of the heap that isn’t currently being swept.
2. A short pause to switch halves.
3. Sweeping of the other half of the heap. This is done while the Java threads are running and are allowed to allocate objects in the part of the heap that was swept first.
4. A short pause for synchronization and recording statistics.

#### Parallel Mark and Sweep
The parallel mark and sweep strategy (also called the parallel garbage collector) uses all available CPUs in the system for performing the garbage collection as fast as possible. All Java threads are paused during the entire parallel garbage collection.

## Swift
In Swift, we use Automatic Reference Counting (ARC) to track and manage your app’s memory usage. In most cases, this means that memory management “just works” in Swift, and you do not need to think about memory management yourself. ARC automatically frees up the memory used by class instances when those instances are no longer needed.

### Automatic Reference Counting
Everytime we create a instance of a class, ARC will allocate some memory for storing its information like
type of the instance, values of stored properties and etc.

When an instance are no longer needed, the ARC will deallocate it to free up some memory for future use. It ensures that
useless instance will not take up space.

When an instance has been deallocated, you will no longer able to access all its information. If you do so, you will get a runtime error and your app will crash simply.

### How ARC works
The way ARC works is by counting how many strong references are being referred to the instance. If there is no more strong
reference, ARC will deallocate that instance.

When we assign an instance to a property, constant or variable, those things will hold a strong reference to that instance.

### Example
```Swift
class Car {
    let maker: String
    init(maker: String) {
        self.maker = maker
        print("\(maker) is being initialized")
    }
    deinit {
        print("\(maker) is being deinitialized")
    }
}


var car1:Car?
var car2:Car?


car1 = Car(maker: "Toyota")
car2 = car1
car1 = nil
car2 = nil
```

At first, we create an instance of Car and assign it to variable car1. This will hold one strong reference of that instance.
The reference count will be 1. Then We assign it to another variable car2, this will make the count equals to 2.
After we assign two nil to both variables, the reference count will be 0 and ARC will sweep out the instance.

### Weak and unowned reference.
Sometimes we will have strong reference cycle which means two class instances hold a strong reference of each other.
This is usually caused by composition relationship.

Let'say we have a class Car and a class Driver. An instance of Car may have a driver instance and a driver instance
may have a car instance. This causes a strong reference cycle.

```Swift
class Car{
    ...
var Driver: d1?
    ...
}

class Driver{
    ...
var Car: c1?
    ...
    }
```

Say we have 2 reference variables car1 and driver1.

```Swift
var car1 : Car? = Car()
var driver1: Driver = Driver()
car1.d1=driver1
driver1.c1=car1
```

After we do

```Swift
car1=nil
driver1=nil
```
Neither the instances will be deallocated. The have strong reference cycle of each other.

#### Solution for strong reference cycle
When we are aware of strong reference cycle, we can fix them by using weak or unowned reference.

Weak and unowned references enable one instance in a reference cycle to refer to the other instance without keeping a strong hold on it. The instances can then refer to each other without creating a strong reference cycle.

A weak reference is a reference that does not keep a strong hold on the instance it refers to, and so does not stop ARC from disposing of the referenced instance. This behavior prevents the reference from becoming part of a strong reference cycle. You indicate a weak reference by placing the weak keyword before a property or variable declaration.

Like a weak reference, an unowned reference does not keep a strong hold on the instance it refers to. Unlike a weak reference, however, an unowned reference is used when the other instance has the same lifetime or a longer lifetime. You indicate an unowned reference by placing the unowned keyword before a property or variable declaration.
