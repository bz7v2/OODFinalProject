//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

//print("Hello world!")
protocol Closeable{
	static var typeProperty:String {get set}
	func close() -> Void
	func checkDoorStatus()->Void
	
}


class House: Closeable{
	var isDoorClosed = false
	static var typeProperty="a static variable in House"
	func close()->Void{
		isDoorClosed = true
		print("Closing door for house")
	}
	func checkDoorStatus()->Void{
		if isDoorClosed == true{
			print("Door is closed")
		}
		
		else{
		print("Door is open")
		}
	}
	
}


class Car: Closeable{
	var isDoorClosed = false
	static var typeProperty="a static variable in Car"
	func close()->Void{
		isDoorClosed = true
		print("Closing door for car")
	}
	func checkDoorStatus()->Void{
		if isDoorClosed == true{
			print("Door is closed")
		}
		
		else{
		print("Door is open")
	}
	}
	
}

var c:Closeable = House()
c.checkDoorStatus()
c.close()
c.checkDoorStatus()
c=Car()
c.checkDoorStatus()
c.close()
c.checkDoorStatus()