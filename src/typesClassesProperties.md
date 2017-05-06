# Types, Classes, Properties, and More
## Java

Java has the standard primitive types, like int, double, byte, short, char, long, float, and boolean. Java also essentially supports additional customizable types through its class system. Commonly used class types in Java include Strings, Arrays, and HashMaps. Java always passes data by reference except for when primitives are being passed.  The only value types java supports are primitives. Java classes are defined in their own files and are fully encapsulated.  They are rather verbosely instantiated and do not have to be deconstructed.  Developers do have to write their own getters and setters in Java. Java classes use ‘this’ to reference themselves. Java largely lacks the backing variables of C#. 

### Instantiation

```java
UIElement e = new UIElement();
```

### Class example

```java
public class Tool {
    //properties
    private int age;
    public String purpose;
    
    //getter
    public int getAge(){
        return age;
    }
    
    //setter
    public void setAge(int age){
        this.age = age;
    }
    
}
```



## Swift

Swift supports a host of types like primitives, structs, enums, functions, and classes. Custom types can be defined with stucts and classes. Swift passes by reference when using classes and functions while Swift passes by value when using everything else like structs, primatives, and enums. Swift classes refer to themselves as “self.” Swift has things similar to backing variables called computed properties which are programmatically defined getters and setters. 

### Instantiation

```java
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
```

### Class example

```java
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

```

### Struct example

```java
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

```