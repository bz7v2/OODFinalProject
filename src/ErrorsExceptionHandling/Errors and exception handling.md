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


