import UIKit

extension Export_VC {
    @objc
    func playFrameByFrame() {
        if noVoiceover {
            return
        }
        playTime += 0.01

        if playTime >= selectedVo.duration {
            playTimer.invalidate()
            stopPlay()
            return
        }

        // transition time
        if playTime >= nextShotTime {
            loadNextShot()
        }

        timeSlider.value = playTime

        guard let shot = AppData.curProject?.shots[curShotIndex] else { return }

        let videoPlayTimeFrame = Int(playTime * 25)
        let shotPlayFrame = videoPlayTimeFrame - Int(shot.startTime! * 25)

        PlayArtworks.playAll(shotPlayFrame,
                             in: shot)
    }
}
