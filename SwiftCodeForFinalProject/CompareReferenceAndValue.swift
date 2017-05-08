//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

//print("Hello world!")
class someClass {
    var a:Int?
    var b:Double?
    var c:String?
    init(a: Int,b: Double,c: String) {
		self.a=a;
		self.b=b;
		self.c=c;        
    }
}

var string1:String = "name"
var string2:String = "name"


//compare string value
if string1 == string2 {
	print("The values are the same")
}else{
	print("The values are not the same")
}


//compare class reference

var someclass1 = someClass(a:1,b:2.0,c:"test")
var someclass2 = someClass(a:1,b:2.0,c:"test")



if someclass1===someclass2{
	print("The references are the same")
}else{
	print("The referencs are not the same")
}