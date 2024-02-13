import Foundation

class AssetsData {

    static var assets: Array<SvgFile> = []

    static func fetchAssets() {
        assets = []

        DispatchQueue.global(qos: .background).async {
            let fm = FileManager.default
            let path = Bundle.main.resourcePath!

            let assetsFolder = path + "/assets"

            do {
                let folders = try fm.contentsOfDirectory(atPath: assetsFolder)

                for folder in folders {
                    //                print("\(artworksFolder)/\(folder)/svg")
                    let svgFolderPath = "\(assetsFolder)/\(folder)/svg"

                    do {
                        let svgs = try fm.contentsOfDirectory(atPath: svgFolderPath)

                        for svgFile in svgs {
                            let nameEverything = svgFile.split(separator: ".")[0]
                            let nameString = nameEverything.components(separatedBy: CharacterSet.decimalDigits).joined()

                            var keywords: Array<String> = []
                            let dashBroken = nameString.split(separator: "-")
                            for each in dashBroken {
                                let spaceBroken = each.split(separator: " ")
                                for any in spaceBroken {
                                    keywords.append(String(any))
                                }
                            }
                            //                                print (svg)

                            let assetPath = "/assets/\(folder)/svg/\(nameEverything)"

                            //                                    "\(thisSvgPath)/\(nameEverything)"
                            //                                                                print (artworkPath)

                            let art = SvgFile(name: nameString,
                                              path: assetPath,
                                              keywords: keywords)

                            // if Asset doesn't have illedgal shit
                            let svgPath: String = Bundle.main.path(forResource: assetPath,
                                                                   ofType: "svg")!
                            let url: URL = URL(fileURLWithPath: svgPath)

                            do {
                                let assetInText = try String(contentsOf: url,
                                                             encoding: String.Encoding.utf8)
                                if !(assetInText.contains("path class")) {
                                    assets.append(art)
                                }
                            } catch { }
                        }

                    } catch {

                    }
                }
            } catch {
                // failed to read directory – bad permissions, perhaps?
            }

            DispatchQueue.main.async {
                print("artwork ready and they are: \(assets.count)")
            }
        }
    }
}
