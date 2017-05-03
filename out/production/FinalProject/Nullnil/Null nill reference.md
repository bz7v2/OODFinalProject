#Null/nil references
##Java
###What we have in Java
In java, we have null reference. A variable is a reference to an object. A null value thus indicates an unset reference (i.e. a reference to nothing). You can see variables as containers(*), inside which you can put an object of a given type, when the variable is null , it means your container is empty.

_**In Java Language Specification**:_
There is also a special null type, the type of the expression null, which has no name. Because the null type has no name, it is impossible to declare a variable of the null type or to cast to the null type. The null reference is the only possible value of an expression of null type. The null reference can always be cast to any reference type. In practice, the programmer can ignore the null type and just pretend that null is merely a special literal that can be of any reference type.

There are basically two instances where we may have a null problem.
1. null is a valid response
2. null is not a valid response
###How to handle null
* We can allow a failure like NullPointerException.
* We can check null reference
* We can use Null Object Pattern which means we create an instance to represent null. For example, an empty collection to
 represent null collection or an instance with some default value to represent a null object for that class.
* We can catch the null exception


##Swift
In Swift, we have optional variables which are allowed to have nil reference. If a variable is't declared as
an optional variable, it cannot have a nil reference and the compiler will show the error.

There are the same two instances where we may have a nil reference.
1. nil is a valid response
2. nil is not a valid response

##How to handle nil
* Force or automatic unwrapping and use IF ELSE block to handle it.
* Optional Binding: We can use "if let" to handle it. This is like if else in Java, the example code will show how to implement this.
* We can use "guard" to handle nil. This is a very innovative unique way in Swift.
* Null Object Pattern: We can have some default instance of the class to represent nil and let other part to handle it.
* We can also do and catch the exception like Java and handle nil. This won't be show in code example.
