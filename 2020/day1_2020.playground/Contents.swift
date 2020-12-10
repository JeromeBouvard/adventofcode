// day 1
import UIKit

// get the file path for the input file in the playground bundle
let filePath = Bundle.main.path(forResource:"day1", ofType: "txt")
// get the contentData
let contentData = FileManager.default.contents(atPath: filePath!)
// get the string
let content = String(data:contentData!, encoding:String.Encoding.utf8)

// create an array containing each line of the input file
let values = content!.components(separatedBy: "\n")
// convert the array of string into array of int
let intArray = values.map{Int($0)!}

// look for 2020 with 2 elements
for element in intArray {
    for element2 in intArray {
        if (element+element2 == 2020) {
            print("we found 2020! \(element) + \(element2)")
            print("product is \(element*element2) \n")
        }
    }
}

// look for 2020 with 3 elements
for element in intArray {
    for element2 in intArray {
        for element3 in intArray {
            if (element+element2+element3 == 2020) {
                print("we found 2020! \(element) + \(element2) + \(element3)")
                print("product is \(element*element2*element3) \n")
            }
        }
    }
}
