// day 5
import UIKit

// get the file path for the input file in the playground bundle
let filePath = Bundle.main.path(forResource:"day5", ofType: "txt")
// get the contentData
let contentData = FileManager.default.contents(atPath: filePath!)
// get the string
let content = String(data:contentData!, encoding:String.Encoding.utf8)

// create an array containing each passport
var plane_seat = content!.components(separatedBy: "\n")

var highest_seat = 0
var list_of_seats = [Int]()

//part 1
for elements in plane_seat {

    let row = Int( (elements.replacingOccurrences(of: "F", with: "0").replacingOccurrences(of: "B", with:"1").replacingOccurrences(of: "L", with: "0").replacingOccurrences(of: "R", with: "1")).prefix(7)  ,radix: 2)
    let column = Int( (elements.replacingOccurrences(of: "F", with: "0").replacingOccurrences(of: "B", with:"1").replacingOccurrences(of: "L", with: "0").replacingOccurrences(of: "R", with: "1")).suffix(3)  ,radix: 2)
    let seat = 8*row!+column!
    list_of_seats.append(seat)
    if (seat > highest_seat) {
        highest_seat = seat
    }
    //sort the list for part 2
    list_of_seats.sort()
}

print("Highest value for seat : \(highest_seat)")

//part 2
for value in 0...list_of_seats.count-2{
    if list_of_seats[value+1]-list_of_seats[value] != 1 {
        print("Your seat is \(list_of_seats[value]+1)")
    }
}



