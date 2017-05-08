# Interface Comparison
## Java
### Java support Interface
In the Java programming language, an interface is a reference type, similar to a class, that can contain only constants, method signatures, default methods, static methods, and nested types. Method bodies exist only for default methods and static methods. Interfaces cannot be instantiated—they can only be implemented by classes or extended by other interfaces.
### What abilities does it have
Interface has the ability to extend existing interfaces. It can extend multiple interfaces at one time. (Which
Class in java cannot). A class can implement multiple interfaces though. Multiple class can implement the same interface.

For example, A car can have a door and it can implement the closeable interface.
Also, a house can have a door and it can implement the closeable interface too.
The code example will be given.
### How is it used
Interface are defined by the key word _**Interface**_. The interface body can contain abstract methods, default methods, and static methods. An abstract method within an interface is followed by a semicolon, but no braces (an abstract method does not contain an implementation). Default methods are defined with the default modifier, and static methods with the static keyword. All abstract, default, and static methods in an interface are implicitly public, so you can omit the public modifier.
In addition, an interface can contain constant declarations. All constant values defined in an interface are implicitly public, static, and final. Once again, you can omit these modifiers.

Remember to use word _extend_ for extending an interface and _implement_ for implementing an interface in class.

### Little summary:
    1. An interface declaration can contain method signatures, default methods, static methods and constant
    definitions. The only methods that have implementations are default and static methods.
    2. A class that implements an interface must implement all the methods declared in the interface.
    3. An interface name can be used anywhere a type can be used.

### [See a simple Java examples here](InterfaceExample.java)

## Swift
### Swift support Protocols
In swift, the equivalent of java Interface is protocols.A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
### What abilities does it have
The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

In addition to specifying requirements that conforming types must implement, you can extend a protocol to implement some of these requirements or to implement additional functionality that conforming types can take advantage of.

The protocols can require any conforming type to provide an instance variable by name and type. It can specifies whether each variable must be gettable or both gettable and settable.
### How is it used
#### Syntax
You define protocols in a very similar way to classes, structures, and enumerations:

    protocol SomeProtocol {
    // protocol definition goes here
    }
types state that they adopt a particular protocol by placing the protocol’s name after the type’s name, separated by a colon, as part of their definition. Multiple protocols can be listed, and are separated by commas:

    struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
    }
If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:

    class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
    }
#### Property Requirements
A protocol can require any conforming type to provide an instance variable or static (type) varible with a particular
name and type.Property requirements are always declared as variable properties, prefixed with the var keyword.
Always prefix type property requirements with the static keyword when you define them in a protocol.

#### Method Requirements
Protocols can require specific instance methods and type methods to be implemented by conforming types. These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but without curly braces or a method body.
As with type property requirements, you always prefix type method requirements with the static keyword when they are defined in a protocol.

#### Initializer Requirements
Protocols can require specific initializers to be implemented by conforming types. You write these initializers as part of the protocol’s definition in exactly the same way as for normal initializers, but without curly braces or an initializer body.

    protocol SomeProtocol {
    init(someParameter: Int)
    }

#### Protocols as types
You can use a protocol in many places where other types are allowed.
* As a parameter type or return type in a function, method, or initializer
* As the type of a constant, variable, or property
* As the type of items in an array, dictionary, or other container

#### Collections of  Protocol types
A protocol can be used as the type to be stored in a collection such as an array or a dictionary.

#### Protocol Inheritance
A protocol can inherit one or more other protocols and can add further requirements on top of the requirements it inherits. The syntax for protocol inheritance is similar to the syntax for class inheritance, but with the option to list multiple inherited protocols, separated by commas.

#### Class-only Protocol
We can limit protocol adoption to class types (and not structures or enumerations) by adding the class keyword to a protocol’s inheritance list. The class keyword must always appear first in a protocol’s inheritance list, before any inherited protocols:

### [See a simple Swift example here](../../SwiftCodeForFinalProject/ProtocalExample.swift)

## Summary
For Swift, the protocol is like Java interface but it has more flexibility. The protocol can be conformed by struct, enumeration and class. They both have the ability to
require instance methods but protocol can also require properties with a particular name and type as well as gettable and settable. In the Swift, we cannot initialize the value of static
variables unlike Java. There are a lot differences between Java interface and Swift protocol. Basically, Swift protocols
are like an advanced version of Java interfaces. Protocols have a lot of unique and nice features compared to Java interfaces.

