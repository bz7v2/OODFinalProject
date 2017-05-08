//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

//print("Hello world!")


//Force unwrapping
var myString:String? = "Some random string value showed by force unwrapping"


if myString != nil {
   print(myString!)
}else {
   print("myString has nil value")
}

//Automatic unwrapping
var myString2:String! 
myString2 = "Some random string value showd by automatic unwrapping"


if myString != nil {
   print(myString2)
}else {
   print("myString2 has nil value")
}

//Optional Binding
var myString3:String?

if let bindedString = myString3{
	print("The value of bindedString is:" + bindedString)
}else{
	print("myString3 has a nil reference")
}

//use Guard



func guardTest(){
	let myString4:String? = nil
	let myString5:String? = "some random value for myString5"
	
	
	guard let string5Value = myString5 else{
	print("myString5 doesn't have a value")
	return
}
	
	guard let string4Value = myString4 else{
	print("myString4 doesn't have a value")
	return
}

}


//Null Object Pattern
let NullString:String = ""

var myString6:String = NullString

print("myString6 has: "+myString6)
