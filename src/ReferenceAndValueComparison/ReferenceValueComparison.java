package ReferenceAndValueComparison;


/**
 * Created by Xinjian Yao on 5/3/2017.
 */
public class ReferenceValueComparison {

    public static void main(String[] args) {
        String a="test";
        String b=new String("test");
        String c=new String("test");

        System.out.println(a==b);
        System.out.println(b==c);
        System.out.println(a.equals(b));
        System.out.println(b.equals(c));
    }

}
