#Inheritance / extension

##Java
Inheritance in java is a mechanism in which one object acquires all the properties and behaviors of parent object.
The idea behind inheritance is that you can reuse the existing code and you can add or modify existing methods.
Inheritance represents the IS-A relationship, also known as parent-child relationship.

We use the keyword extends to inherit the properties of the class.
Inheritance represents the IS-A relationship, also known as parent-child relationship.

###Syntax
```Java
class Super {
   .....
   .....
}
class Sub extends Super {
   .....
   .....
}
```

We can also use the keyword __*super*__ to access the superclass members.
###Types of inheritance
There are 3 types of class inheritance.
* Single inheritance
* multilevel inheritance
* Hierarchical inheritance

![alt text](https://www.javatpoint.com/images/core/typesofinheritance.jpg)

In java, we don't support multiple and hybrid inheritance. We can use interface to fulfill it though.
![alt text](https://www.javatpoint.com/images/core/multiple.jpg)

####Single Inheritance Example
```Java
class Animal{
void eat(){System.out.println("eating...");}
}
class Dog extends Animal{
void bark(){System.out.println("barking...");}
}

```
In the above example, we have a subclass called Dog which inherits the Animal super class. So it has both the eat
and bark methods.

####Multilevel Inheritance
```Java
class Animal{
void eat(){System.out.println("eating...");}
}
class Dog extends Animal{
void bark(){System.out.println("barking...");}
}
class BabyDog extends Dog{
void weep(){System.out.println("weeping...");}
}
```

In the above example, we have multilevel relationship. Dog extends Animal and BabyDog extends Dog. The subclass
BadyDog has all the 3 methods.

####Hierarchical Inheritance
```Java
class Animal{
void eat(){System.out.println("eating...");}
}
class Dog extends Animal{
void bark(){System.out.println("barking...");}
}
class Cat extends Animal{
void meow(){System.out.println("meowing...");}
}
```

In the above example, we have a hierarchical inheritance. Both Cat and Dog classes are inheriting Animal class.

####Multiple Inheritance
Unlike C++, we don't have multiple inheritance in Java. The reason is to reduce code complexity and simplify the
language. If a class inherits from two classes that have the same method. When you call that method from the subclass,
which method will be actually called? That's the confusion.


####Methods overriding
We can override a method in subclass by @override annotation.
Here is an example.
```Java
class Animal{
void makeVoice(){;}
}
class Dog extends Animal{
@Override
void makeVoice(){System.out.println("Woof...");}
}
class Cat extends Animal{
@Override
void makeVoice(){System.out.println("meowing...");}
}
```


##Swift
In Swift, we have inheritance. A class can inherit methods, properties, and other characteristics from his superclass.
Inheritance is a fundamental behavior that differentiates classes from other types in Swift.
Classes in Swift can call and access methods, properties, and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties, and subscripts to refine or modify their behavior.


###Base Class
Any Class that do not have a superclass is a base class. Unlike in Java, all the classes have a base Class called Object.
That's the fundamental concept of Java. As the example showed above in Java, we can have a base Class Animal.
```Swift
class Animal{
    func makeVoide(){
        print("make some noise")
    }
}
```

###subclass
We can colon to indicate that one class inherit from another class
```Swift
class Dog : Animal{

}
```

Here we can also use *__super__* keyword to access the superclass members.


###Override
We can use keyword *__override__* to provide alternative implementation in the subclass
```Swift
class Dog : Animal{
    override func makeVoide(){
    print("woof....")
}
```

###Types of inheritance
Just like Java, swift have 3 types of inheritance
* Single inheritance
* multilevel inheritance
* Hierarchical inheritance


And Swift also doesn't support multiple inheritance to reduce code complexity.
All the others are very similar to java, just having different syntax.

###preventing overrides
In Swift, we can prevent overriding by using the keyword __*final*__. You can also put final modifier before
the class. Any attempt to override or inherit the final will have a compile error.
This is also like Java where we use *__final_* to prevent any inheritance.