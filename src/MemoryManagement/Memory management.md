#Memory management
##Java
In Java, Memory management is the process of allocating new objects and removing unused objects to make space for those new object allocations.

###The Heap and the Nursery
Java objects reside in an area called the heap. The heap is created when the JVM starts up and may increase or decrease in size while the application runs. When the heap becomes full, garbage is collected. During the garbage collection objects that are no longer used are cleared, thus making space for new objects.

The heap is sometimes divided into two areas (or generations) called the nursery (or young space) and the old space. The nursery is a part of the heap reserved for allocation of new objects. When the nursery becomes full, garbage is collected by running a special young collection, where all objects that have lived long enough in the nursery are promoted (moved) to the old space, thus freeing up the nursery for more object allocation. When the old space becomes full garbage is collected there, a process called an old collection.

###Garbage Collection
Java handles memory by garbage collection. It is called *mark and sweep garbage collection model*.

####Mark Phase
During the mark phase all objects that are reachable from Java threads, native handles and other root sources are marked as alive, as well as the objects that are reachable from these objects and so forth. This process identifies and marks all objects that are still used, and the rest can be considered garbage.

####Sweep phase
During the sweep phase the heap is traversed to find the gaps between the live objects. These gaps are recorded in a free list and are made available for new object allocation.

###Types of Garbage Collection
* concurrent mark and sweep strategy
* Parallel Mark and Sweep

####concurrent mark and sweep strategy
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

####Parallel Mark and Sweep
The parallel mark and sweep strategy (also called the parallel garbage collector) uses all available CPUs in the system for performing the garbage collection as fast as possible. All Java threads are paused during the entire parallel garbage collection.

##Swift
In Swift, we use Automatic Reference Counting (ARC) to track and manage your app’s memory usage. In most cases, this means that memory management “just works” in Swift, and you do not need to think about memory management yourself. ARC automatically frees up the memory used by class instances when those instances are no longer needed.
