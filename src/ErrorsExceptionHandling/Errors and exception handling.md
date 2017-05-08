# Errors and exception handling
## Java
### Exception
In Java, Exception is something happened during the execution of a program. An exception will disrupt the program and
terminate it abnormally thus need to be handled.
There are many different reasons for exception to arise. Maybe a user inputs an invalid data type, a file cannot be found
from the path or some hardware failure.
### Exception types
In Java, we have three different types of exception.
* Checked exceptions
* Unchecked exceptions
* Errors

#### Checked exceptions
A checked exception will occur at compile time. Checked exceptions cannot be ignored, the compiler will catch it
during compile time and will let compiling fail if you don't handle them. Programmer should take care of their
exceptions.

#####Example

```Java
import java.io.*;
class Example {
   public static void main(String args[])
   {
	FileInputStream fis = null;
	/*This constructor FileInputStream(File filename)
	 * throws FileNotFoundException which is a checked
	 * exception*/
        fis = new FileInputStream("B:/myfile.txt");
	int k;

	/*Method read() of FileInputStream class also throws
	 * a checked exception: IOException*/
	while(( k = fis.read() ) != -1)
	{
		System.out.print((char)k);
	}

	/*The method close() closes the file input stream
	 * It throws IOException*/
	fis.close();
   }
}
```
FileInputStream which is used for specifying the file path and name, throws FileNotFoundException. The read() method which reads the file content throws IOException and the close() method which closes the file input stream also throws IOException.



#####List of some checked exceptions
1. IOException
2. SQLException
3. DataAccessException
4. ClassNotFoundException
5. InvocationTargetException
6. MalformedURLException

There are two ways to handle this. Add *__throws clause__* OR Add **_Try, Catch and finally block_**.

#####Using throws
```Java
import java.io.*;
class Example {
   public static void main(String args[]) throws IOException
   {
      FileInputStream fis = null;
      fis = new FileInputStream("B:/myfile.txt");
      int k;

      while(( k = fis.read() ) != -1)
      {
	   System.out.print((char)k);
      }
      fis.close();
   }
}
```

#####Using try and catch
```Java
import java.io.*;
class Example {
   public static void main(String args[])
   {
	FileInputStream fis = null;
	try{
	    fis = new FileInputStream("B:/myfile.txt");
	}catch(FileNotFoundException fnfe){
            System.out.println("The specified file is not " +
			"present at the given path");
	 }
	int k;
	try{
	    while(( k = fis.read() ) != -1)
	    {
		System.out.print((char)k);
	    }
	    fis.close();
	}catch(IOException ioe){
	    System.out.println("I/O error occurred: "+ioe);
	 }
   }
}
```
####Unchecked exceptions
An unchecked exceptions will not be verified by compiler. There usually arise because of bad programming.
All unchecked exceptions are direct sub classes of RunTimeException class.

#####Example
Here is an *__ArrayIndexOutOfBoundsException__* example

```Java
class Example {
   public static void main(String args[])
   {
	int arr[] ={1,2,3,4,5};
	/*My array has only 5 elements but
	 * I'm trying to display the value of
	 * 8th element. It should throw
	 * ArrayIndexOutOfBoundsException*/
	System.out.println(arr[7]);
   }
}
```
This code would also compile successfully since ArrayIndexOutOfBoundsException is also an unchecked exception.

#####Using try and catch

```Java
class Example {
	public static void main(String args[])
	{
		try{
		int arr[] ={1,2,3,4,5};
		System.out.println(arr[7]);
		}catch(ArrayIndexOutOfBoundsException e){
			System.out.println("The specified index does not exist " +
					"in array. Please correct the error.");
		}
	}
}
```

#####List of some unchecked exceptions
1. NullPointerException
2. ArrayIndexOutOfBound
3. IllegalArgumentException
4. IllegalStateException

The most famous one is NullPointerException lol. If we don't handle them, they will cause the program to crash.
The way to handle them are still **_Try, Catch and finally block_**. We could handle multiple exceptions in a single catch block.

#### Error
![alt text](https://www.tutorialspoint.com/java/images/exceptions1.jpg)

Errors are something unique. There are two subclasses from the Throwable class: Exception and Error. They are beyond the control of users or programmers. They are ignored
in the codes because you can barely do anything about hardware failure like out of memory or network unavailable.



## Swift
In Swift, errors are represented by values of types that conform to the Error protocol.
This empty protocol indicates that a type can be used for error handling.
Swift enumerations are particularly well suited to modeling a group of related error conditions.

Here is an example enumerations
```Swift
enum ExampleError: Error {
    case Error1
    case Error2(someUsefulInformation: Int)
    case Error3
}
```
Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can’t continue. You use a *throw* statement to throw an error.

```Swift
throw ExampleError.Error2(someUsefulInformation: 3)
```

###Handling Errors
There are 4 ways in Swift to handle errors.
1. We can propagate the error from a function to the scope from which it is called.
2. wrapping the part which may throw errors with do-catch block.
3. handle the error as an optional value
4. assert that the error will not occur.

####Propagating using Throwing
A function marked with throws is called a throwing function. If the function specifies a return type, you write the throws keyword before the return arrow (->).
A throwing function propagates errors that are thrown inside of it to the scope from which it’s called.

```Swfit
func canThrowErrors() throws -> String

func cannotThrowErrors() -> String
```


####Handling errors by Do-Catch
We use a do-catch statement to handle errors by running a block of code. If an error is thrown by the code in the do clause, it is matched against the catch clauses to determine which one of them can handle the error.

```Swfit
do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}
```

####Handling errors as an optional value
You use try? to handle an error by converting it to an optional value. If an error is thrown while evaluating the try? expression, the value of the expression is nil.

The below examples are doing the same thing.

#####Example1
```Swift
let x = try? someThrowingFunction()
```

```Swift
let x: Int?
do {
    x = try someThrowingFunction()
} catch {
    x = nil
}
```
The value of x will be nil if an exception occurs

####assert that an error will not occur (Disabling Error Propagation)

Sometimes we know a statement may cause an error but we know for sure it won't, we can use try! to do an assertion.

```Swift
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
```

The above example uses the LoadImage function. We know sometimes the images may not exist so it may throw an imageNotFoundError
but we also know the images are inside the resources folder which indeed has the images we want, we can disable error propagation.

If any errors do occur during the runtime, we will get a runtime error and the application will be ceased.

### cleanup actions
In Swift, we can use _**defer**_ to execute a set of statements just before code leaves the current scope. This is like
the finally block in Java where we may want to close the stream whether the code executed smoothly or an error was thrown.


