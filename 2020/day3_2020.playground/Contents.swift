// day 3
import UIKit

// get the file path for the input file in the playground bundle
let filePath = Bundle.main.path(forResource:"day3", ofType: "txt")
// get the contentData
let contentData = FileManager.default.contents(atPath: filePath!)
// get the string
let content = String(data:contentData!, encoding:String.Encoding.utf8)

// create an array containing each line of the input file
var values = content!.components(separatedBy: "\n")

// remove first line, useless
values.remove(at: 0)
// number of singe pattern before repeating
let sizeOfPattern = values[0].count

func numberOfTreesFor(Right:Int, Down:Int)->Int{
    var position = Right
    var tree = 0
    var cnt = 0
    for elements3 in values {
        cnt = cnt + 1
        if (cnt%Down == 0) { // count only if we are on a "line" after a "down" move
            if (elements3[elements3.index(elements3.startIndex, offsetBy: position)]) == "#" {
                tree = tree + 1 // this is a fucking tree!
            }
            position = position + Right // move Right
            if (position >= sizeOfPattern) {
                position = position % sizeOfPattern //overload, infinite pattern
            }
        }
    }
    return tree
}

let tree11 = numberOfTreesFor(Right: 1, Down: 1)
let tree31 = numberOfTreesFor(Right: 3, Down: 1) // part 1
let tree51 = numberOfTreesFor(Right: 5, Down: 1)
let tree71 = numberOfTreesFor(Right: 7, Down: 1)
let tree12 = numberOfTreesFor(Right: 1, Down: 2)

tree11*tree31*tree51*tree71*tree12 // part 2
