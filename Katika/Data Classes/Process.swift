import UIKit

class Process
{
    static let script = ProcessStep(levelName : StepLongEnum.Script,
                                    description: "Let's write the\nscript and record\nvoiceover for video",
                                    levelAcronym: StepAcronymEnum.Sc,
                                    selected : false,
                                    trainings: [Training.script,
                                                Training.collaboration],
                                    storyboardName: "Script",
                                    viewControllerId: "rootVc")
    
    static let shotlist = ProcessStep(levelName : StepLongEnum.Shotlist,
                                      description: "In this step, break\nthe script\n into separate shots",
                                      levelAcronym: StepAcronymEnum.Sh,
                                      selected : false,
                                      trainings: [Training.shotlist,
                                                  Training.collaboration],
                                      storyboardName: "Shotlist",
                                      viewControllerId: "rootVc")
    
    static let graphics = ProcessStep(levelName : StepLongEnum.Graphics,
                                      description: "Assemble your shots\ngraphics using\nassets and artworks",
                                      levelAcronym: StepAcronymEnum.G,
                                      selected : false,
                                      trainings: [Training.graphics, Training.collaboration,
                                                  Training.motion],
                                      storyboardName: "Graphics",
                                      viewControllerId: "rootVc")
    
    static let export = ProcessStep(levelName : StepLongEnum.Export,
                                    description: "In here, export\nyour project as\na final video",
                                    levelAcronym: StepAcronymEnum.E,
                                    selected : false,
                                    trainings: [Training.export],
                                    storyboardName: "Export",
                                    viewControllerId: "rootVc")
    
    
    static var steps : [ProcessStep] = [script, shotlist, export]
        
    static func switchToStep (curStep: StepLongEnum)
    {
        for i in 0..<steps.count
        {
            steps[i].selected = false
            
            if steps[i].levelName == curStep
            {
                steps[i].selected = true
            }
        }
    }
}
