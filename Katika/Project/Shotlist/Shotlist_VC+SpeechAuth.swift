import UIKit
import Speech

extension Shotlist_VC
{
    func getSpeechAuthorization ()
    {
        SFSpeechRecognizer.requestAuthorization { (authStatus) in  //4
            
            switch authStatus {  //5
            case .authorized:
                print("Good to go")
            case .denied:
                print("User denied access to speech recognition")
                
            case .restricted:
                print("Speech recognition restricted on this device")
                
            case .notDetermined:
                print("Speech recognition not yet authorized")
            @unknown default:
                print("Other Shit Happened recognition not yet authorized")
            }
        }
    }
}
