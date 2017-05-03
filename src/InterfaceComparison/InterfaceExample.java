package InterfaceComparison;

/**
 * Created by Xinjian Yao on 5/1/2017.
 */
public class InterfaceExample {
    public static void main(String[] args) {
        House h = new House();
        Car c = new Car();
        Closeable closeable;
        //Test interface static field
        System.out.println(Closeable.constantVar);
        //Test interface static method
        Closeable.myStaticMethod();
        closeable = h;
        //Test accessing interface default method
        h.myDefaultMethod();
        closeable.myDefaultMethod();
        //Test dynamic dispatch
        closeable.close();
        h.checkDoorStatu();
        closeable = c;
        closeable.close();
        c.checkDoorStatu();
    }
}

interface Closeable {
    String constantVar = "I am the constant variable inside interface closeable";

    static void myStaticMethod() {
        System.out.println("static method in interface closeable");
    }

    default void myDefaultMethod() {
        System.out.println("default method in interface closeable");
    }

    void close();
}


class House implements Closeable {
    boolean isDoorClosed = false;

    @Override
    public void close() {
        isDoorClosed = true;
        System.out.println("Closing door for house");
    }

    public void checkDoorStatu() {
        if (isDoorClosed)
            System.out.println("Door is closed");
        else
            System.out.println("Door is open");
    }
}

class Car implements Closeable {
    boolean isDoorClosed = false;

    @Override
    public void close() {
        isDoorClosed = true;
        System.out.println("Closing door for Car");
    }

    public void checkDoorStatu() {
        if (isDoorClosed)
            System.out.println("Door is closed");
        else
            System.out.println("Door is open");
    }
}
