import Foundation

class Keyframe: NSObject, NSCoding {

    var value: Float
    var time: Int

    init(value: Float, time: Int) {
        self.value = value
        self.time = time
    }

    func encode(with coder: NSCoder) {
        coder.encode(NSNumber(value: self.value),
                     forKey: "value")
        coder.encode(NSNumber(value: self.time),
                     forKey: "time")
    }

    required convenience init?(coder: NSCoder) {
        let value = coder.decodeObject(forKey: "value") as! NSNumber
        let time = coder.decodeObject(forKey: "time") as! NSNumber

        self.init(value: value.floatValue,
                  time: time.intValue)
    }
}
