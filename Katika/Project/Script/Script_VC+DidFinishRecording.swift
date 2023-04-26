import AVFoundation

extension Script_VC
{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder,
                                         successfully flag: Bool)
    {
        let newVoiceover = Voiceover(name: currentRecordingName,
                                     fileName: currentRecordingName,
                                     duration: recordingTime,
                                     selected: false)
        
        ifNoProject ()
        
        if let vos = AppData.curProject?.voiceOvers
        {
            if (vos.count == 0)
            {
                newVoiceover.selected = true
            }
        }
        else
        {
            AppData.curProject?.voiceOvers = []
        }
        
        
        // TODO: this is temp saving the project
        
        ReadWrite.write()
        
        AppData.curProject!.voiceOvers.append(newVoiceover)

        recordingsTableView.reloadData()
    }
}
