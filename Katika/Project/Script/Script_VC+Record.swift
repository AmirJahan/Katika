import UIKit
import AVFoundation

extension Script_VC:
    AVAudioRecorderDelegate,
    AVAudioPlayerDelegate
{
    @IBAction func recordOrStop (_ sender: UIButton)
    {
//        let tempAlert = UIAlertController(title: "No Need",
//                                          message: "You don't need to record a voice over now. It's already been recorded for you",
//                                          preferredStyle: UIAlertController.Style.alert)
//        
//        tempAlert.addAction(UIAlertAction(title: "Ok",
//                                          style: UIAlertAction.Style.default, handler: nil))
//        
//        self.present(tempAlert, animated: true, completion: nil)
//        
//        return
        
        
        
        if ( !recording )
        {
            buttonRecordingMode ()
            recording = true
            recordTimeCounter.isHidden = false
            recordTimeCounter.text = "0' : 0.0"
            recordingTime = 0.0
            recordingTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                                  target: self,
                                                  selector: #selector(timeCounter),
                                                  userInfo: nil,
                                                  repeats: true)
            
            beginRecord()
        }
        else // stop recording
        {
            buttonStoppedMode()
            recording = false
            recordTimeCounter.isHidden = true
            recordingTimer?.invalidate()
            stopRecording ()
        }
    }
    
    @objc
    func timeCounter()
    {
        recordingTime += 0.1
        let decimal = recordingTime - floor(recordingTime)
        let seconds = Int(recordingTime) % 60
        let minutes = Int(recordingTime) / 60
        
        let minutesString = "\(minutes)\' : "
        let secondsString = "\(seconds)\" : "
        let decimalString =  "\(Int(decimal*10))"
        var labelString = ""
        if ( minutes > 0 )
        {
            labelString += minutesString
        }
        
        labelString += secondsString
        labelString += decimalString
        
        
        recordTimeCounter.text = labelString
    }
    
    
    func beginRecord()
    {
        // beging the recording
        ifNoProject ()
        if let vos = AppData.curProject?.voiceOvers
        {
        attempt = vos.count
        }
        else
        {
            AppData.curProject?.voiceOvers = []
            attempt = 0
        }

        let title = titleTextField.text
        currentRecordingName = ReadWrite.getNewVoName(title ?? "_", attempt)
        
        let url = ReadWrite.buildVoUrl(title: title!,
                                       name: currentRecordingName)
        
        let mySettings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            recorder = try AVAudioRecorder(url: url,
                                           settings: mySettings)
            
            guard let rec = recorder else {
                print("Rec Error")
                return
                
            }
            
            rec.delegate = self
            rec.record()
        }
        catch
        {
            
        }
    }
    
    func stopRecording()
    {
        recorder?.stop()
        recorder = nil
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer,
                                     successfully flag: Bool)
    {
        
    }
}
