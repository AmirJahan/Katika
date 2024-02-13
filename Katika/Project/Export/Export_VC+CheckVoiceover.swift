import UIKit

extension Export_VC {
    func checkVoiceover() {
        if (AppData.curProject!.voiceOvers.count > 0) {
            noVoiceover = false
        } else {
            let alert = UIAlertController(title: "No Voice Over",
                                          message: "You haven't recorded a voice over yet. Before you can view your video, you need to go back and record your voice over.", preferredStyle: UIAlertController.Style.alert)

            let okAction = UIAlertAction(title: "It's Ok",
                                         style: UIAlertAction.Style.default) { (act) in
                                            alert.dismiss(animated: true,
                                                          completion: nil)
            }
            alert.addAction(okAction)

            self.present(alert, animated: true, completion: nil)
            return
        }

        for vo in AppData.curProject!.voiceOvers {
            if vo.selected {
                selectedVo = vo
            }
        }

        let duration = selectedVo.duration

        timeSlider.maximumValue = duration
        timeSlider.minimumValue = 0
        timeSlider.value = 0
    }
}
