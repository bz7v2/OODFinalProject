# Errors and exception handling
## Java
### Exception
In Java, Exception is something happened during the execution of a program. An exception will disrupt the program and
terminate it abnormally thus need to be handled.
There are many different reasons for exception to arise. Maybe a user input an invalid data type, a file cannot be found
from the path or some hardware failure.
### Exception types
In Java, we have three different types of exception.
* Checked exceptions
* Unchecked exceptions
* Errors

#### Checked exceptions
A checked exception will occur at compile time. Checked exceptions cannot be ignored, the compiler will catch it
during compile time and will let compiling fail if you don't handle them. Programmer should take care of there
exceptions.

##### List of some checked exceptions
1. IOException
2. SQLException
3. DataAccessException
4. ClassNotFoundException
5. InvocationTargetException
6. MalformedURLException

There are two ways to handle this. Add *__throws clause__* OR Add **_Try, Catch and finally block_**.


#### Unchecked exceptions
An unchecked exceptions will not be verified by compiler. There usually arise because of bad programming.
All unchecked exceptions are direct sub classes of RunTimeException class.

##### List of some unchecked exceptions
1. NullPointerException
2. ArrayIndexOutOfBound
3. IllegalArgumentException
4. IllegalStateException

The most famous one is NullPointerException lol. If we don't handle them, they will cause the program to crash.
The way to handle them are still **_Try, Catch and finally block_**. We could handle multiple exceptions in a single catch block.

#### Error
![alt text](https://www.tutorialspoint.com/java/images/exceptions1.jpg)

Errors are something unique. There are two subclasses from the Throwable class. One is Exception, the other is Error. They are beyond the control of users or programmers. They are ignored
in the codes because you can barely do anything about hardware failure like out of memory or network unavailable.
