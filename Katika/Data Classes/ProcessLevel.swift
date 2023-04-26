import Foundation

struct ProcessStep
{
    var level: String
    var selected: Bool
    var trainings : [Training]?
}




class Process
{
    let title = ProcessStep(level: "Video Title",
                             selected: false,
                             trainings: [TrainingData.shared.howAreMgsCreated, TrainingData.shared.collaborate])
    let detials = ProcessStep(level : "Details",
                               selected : false,
                               trainings: [TrainingData.shared.shotDescriptions, TrainingData.shared.collaborate])
    let script = ProcessStep(level : "Script",
                              selected : false,
                              trainings: [TrainingData.shared.stories, TrainingData.shared.voiceover, TrainingData.shared.collaborate])
    let shotlist = ProcessStep(level : "Shotlist",
                                selected : false,
                                trainings: [TrainingData.shared.shotlist, TrainingData.shared.collaborate])
    let graphics = ProcessStep(level : "Graphics",
                                selected : false,
                                trainings: [TrainingData.shared.graphics, TrainingData.shared.artwork, TrainingData.shared.collaborate])
    let export = ProcessStep(level : "Export",
                              selected : false,
                              trainings: [TrainingData.shared.transitions, TrainingData.shared.export, TrainingData.shared.collaborate])
    
    
    
    static var levels : [ProcessStep] = []
    


    static func switchProcess (curLevel: String)
    {
        for i in 0..<levels.count
        {
            levels[i].selected = false
            
            if levels[i].level == curLevel
            {
                levels[i].selected = true
            }
        }
    }
}

