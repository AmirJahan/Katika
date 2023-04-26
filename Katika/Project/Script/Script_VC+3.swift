//import UIKit
//
//extension Script_VC

//{
//    func calculateLengthfor (newLength: Int)
//    {
//        let seconds = newLength % 60
//        let minutes = newLength / 60
//        
//        var minutesString = "\(minutes) minutes"
//        if ( minutes == 1)
//        {
//            minutesString = "\(minutes) minute"
//        }
//        
//        let secondsString = " and \(seconds) seconds"
//        var labelString = ""
//        if ( minutes > 0 )
//        {
//            labelString += minutesString
//        }
//        if ( seconds != 0)
//        {
//            labelString += secondsString
//        }
//        
//        lengthLabel.text = labelString
//        
//        let wordCount = minutes * 150 + Int((Float(seconds)/60.0) * 150)
//        let paragraphCount = Float(wordCount) / 250.0
//        let paragraphCountString = String(format: "%.1f", paragraphCount)
//        
//        let paragraphsString = "A video of this length would approximately need about \(wordCount) words or " +  paragraphCountString + " paragraphs of a script."
//    }
//}
