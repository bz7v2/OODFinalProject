# Reflection
##Java
Java Reflection makes it possible to inspect classes, interfaces, fields and methods at runtime, without knowing the names of the classes, methods etc. at compile time. It is also possible to instantiate new objects, invoke methods and get/set field values using reflection.
Reflection is commonly used by programs which require the ability to examine or modify the runtime behavior of applications running in the Java virtual machine. This is a relatively advanced feature and should be used only by developers who have a strong grasp of the fundamentals of the language. With that caveat in mind, reflection is a powerful technique and can enable applications to perform operations which would otherwise be impossible.

###What can we get from reflection
Using reflection, we can inspect Java classes at runtime. Here is the list of what we can obtain.
* Class Name
* Class Modifies (public, private, synchronized etc.)
* Package Info
* Superclass
* Implemented Interfaces
* Constructors
* Methods
* Fields
* Annotations

####Class Name
Before we do anything, we need to obtain the Java.lang.Class Object. All types in Java including the primitive types (int, long, float etc.) including arrays have an associated Class object.

```Java
Class myObjectClass = MyObject.class;
```
We can also get the Class Object by className.

```Java
 Class class = Class.forName(className);
 ```

####Class Name
we can two version of class name by using the Class Object.

To get the full name, we use
```Java
 Class aClass = MyObject.class;
    String className = aClass.getName();
```

To get just the name without anything else we use
```Java
  Class aClass = MyObject.class;
    String simpleClassName = aClass.getSimpleName();
```

####Modifiers
We can access the modifiers of a class via the Class object.
we can do
```Java
int modifiers = aClass.getModifiers();
```

The modifiers are packed into an int where each modifier is a flag bit that is either set or cleared. You can check the modifiers using these methods in the class java.lang.reflect.Modifier

####Package Info
We can obtain information about the package from a Class.
```Java
Package package = aClass.getPackage();
```

From the Package object you have access to information about the package like its name.

####SuperClass
We can access the superclass information of the class.
```Java
Class superclass = aClass.getSuperclass();
```

####Implemented Interfaces
We can also get a list of interfaces it implemented.
```Java
Class[] interfaces = aClass.getInterfaces();
```

Note: only the interfaces that declared by the curent class will be included. Even if some imterfaces are
implemented by its superclass, those will not be included.


####Constructors
We can access the constructors via the Class Object.
```Java
 Constructor[] constructors = aClass.getConstructors();
```

####Methods
For methods, we can use
```Java
Method[] method = aClass.getMethods();
```

####Fields
We can also inspect fields in the class
```Java
Field[] method = aClass.getFields();
```

####Annotations
We can access annotations like this
```Java
Annotation[] annotations = aClass.getAnnotations();
```

##Swift
In Swift, it still offers a Reflection mechanism as part of the standard library.
Swift's reflection capabilities are based around a struct called *__Mirror__*. You create a mirror for a particular subject and the mirror will then let you query it.

###How to create a Mirror.
The easiest way of creating a mirror is the reflecting initializer.
Here is its initializer.
```Swift
public init(reflecting subject: Any)
```
Here is the example
```Swift
let aMirror = Mirror(reflecting: someClassName)
```

The type of the subject is Any. This is the most general type in Swift. Anything the Swift sun is at least
 of type Any 1. So this makes the mirror compatible with struct, class, enum, Tuple, Array, Dictionary,
 set, etc.

 The Mirror struct contains several types to help you identify the information you'd like to query.

###How to use a Mirror
Here is the list of available properties / methods on a Mirror:
* let children: Children: The child elements of our subject
* displayStyle: Mirror.DisplayStyle?: The display style of the subject
* let subjectType: Any.Type : The type of the subject
* func superclassMirror() -> Mirror?: The mirror of the subject's superclass

####displayStyle
It will just return a case of the DisplayStyle enum.
```Swift
public enum DisplayStyle {
    case Struct
    case Class
    case Enum
    case Tuple
    case Optional
    case Collection
    case Dictionary
    case Set
}
```
Those are the supported types of the reflection API. As we saw earlier, reflection only requires an Any type, and there're many things in the Swift standard library that are of type
Any but aren't listed in the DisplayStyle enum above. If you're trying to reflect over an unsupported type, you'll get an empty Optional back. (nil back)

####childern
This returns a AnyForwardCollection<Child> with all the children that the subject contains. Children are not limited to entries in an Array or Dictionary. All properties of a struct or class, for example, are also children returned by this property. The protocol AnyForwardCollection means that this is a collection type with indices that support forward traversal.
```Swift
aMirror.childer
```

####SubjectType
Will return the type of the subject.
```Swift
print(Mirror(reflecting: 5).subjectType)
//prints : Int
print(Mirror(reflecting: "test").subjectType)
//prints : String
print(Mirror(reflecting: NSNull()).subjectType)
//print : NSNull
```

####Superclass Mirror
This is the mirror of the superclass of our subject. If the subject is not a class, this will be an empty Optional. If this is a class-based type, you'll get a new Mirror.
```Swift
aMirror.superclassMirror()
```
