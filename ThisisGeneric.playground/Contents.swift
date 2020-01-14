import Foundation

struct CountedSet<Element: Hashable> {
    private var dict = [Element: Int]()
    
    var count: Int {
        return dict.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    subscript(_ member: Element) -> Int {
        if let number = dict[member] {
            return number
        } else {
            return 0
        }
    }
    
  mutating func insert(_ item: Element) {
        if dict.keys.contains(item) {
            if let number = dict[item] {
                dict[item] = number + 1
            }
        } else {
            dict[item] = 1
       }
    }
    
    mutating func remove(_ item: Element) -> Int {
        if let number = dict[item], number > 1 {
            dict[item] = number - 1
        } else {
            dict.removeValue(forKey: item)
        }
        return dict[item] ?? 0
    }
    
    func contains(_ item: Element) -> Bool {
        return dict.keys.contains(item)
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
}

var testSet = CountedSet<Int>()
testSet.insert(2)
testSet.insert(4)
testSet.insert(2)
print(testSet[2])
print(testSet)
testSet.remove(2)
print(testSet)
print(testSet.count)
print(testSet.isEmpty)


var newTestSet : CountedSet = ["hi","bye","seeya", "later gator"]
newTestSet.insert("hi")
print(newTestSet["hi"])


var thirdTestSet: CountedSet = [3.2,6.9,21.1]
thirdTestSet.insert(6.9)
print(thirdTestSet[6.9])
thirdTestSet.remove(6.9)
print(thirdTestSet[6.9])
print(thirdTestSet.contains(6.1))
print(thirdTestSet.contains(6.9))

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }

var aCountedSet = CountedSet<Arrow>()
print(aCountedSet[.iron])
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet[.iron])
print(myCountedSet.remove(.iron))
print(myCountedSet[.iron])
print(myCountedSet.remove(.dwarvish))
print(myCountedSet.remove(.magic))


