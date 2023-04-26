import Foundation
import Speech

extension Shotlist_VC
{
    func recognize(voiceover: Voiceover,
                      completionHandler: @escaping (Array<TimedWord>) -> ())
       {
           var timedArr : Array<TimedWord> = []
 
           guard let myRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US")) else
           {
               // A recognizer is not supported for the current locale
               print("A recognizer is not supported for the current locale")
               return
           }
           
           if !myRecognizer.isAvailable
           {
               // The recognizer is not available right now
               print("The recognizer is not available right now")
               print("You need to enable ")
               
               return
           }
           
        let title = AppData.curProject?.title
        let url = ReadWrite.buildVoUrl(title: title!, name: voiceover.name)
           let request = SFSpeechURLRecognitionRequest(url: url)
           
        
           myRecognizer.recognitionTask(with: request) { (result, error) in
               guard let result = result else
               {
                   print("Recognition failed, so check error for details and handle it")
                   
                   print(error.debugDescription)
                   // Recognition failed, so check error for details and handle it
                   return
               }
               
               // Print the speech that has been recognized so far
               if result.isFinal
               {
                   //                print ("is final called")
                   let segments = result.bestTranscription.segments
                   
                   for seg in segments
                   {
                       for subSeg in seg.substring.split(separator: " ")
                       {
                           let timeStamp = Float(Int(seg.timestamp * 100))/100.0
                           let newWord = TimedWord(timeStamp: timeStamp,
                                                   word: String(subSeg))
                           timedArr.append(newWord)
                       }
                   }
                   
                   completionHandler (timedArr)
                
               }
           }
       }
}
