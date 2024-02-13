import UIKit

extension Export_VC {
    func loadNextShot() {
        curShotIndex += 1

        if curShotIndex == AppData.curProject?.shots.count {
            return
        }

        setShot(animated: true)
    }
}
