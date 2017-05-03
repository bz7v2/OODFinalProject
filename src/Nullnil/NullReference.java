package Nullnil;

/**
 * Created by Xinjian Yao on 5/2/2017.
 */
public class NullReference {
    public static void main(String[] args) {
        Integer a = null;
        Integer b = null;
        //allow a failure (java.lang.NullPointerException)
        //String s=a.toString();

        //check null reference
        if (b != null)
            System.out.println("The value of String s is: " + b.toString());
        else
            System.out.println("Null reference caught!");

        //Null Object Pattern (with some default value)
        //Null Integer Object
        Integer NullInteger = 0;
        Integer c = NullInteger;
        System.out.println("The value of String s is: " + c.toString());


        //Catch the exception
        Integer d = null;
        try {
            System.out.println("The value of String s is: " + d.toString());
        } catch (NullPointerException e) {
            System.out.println("Null reference caught!");
        }
    }

}
