import Foundation

class Training
{
    static let breakApartVideo =
        TrainingStep(storyboard: "BreakApart_Video",
                     description: "Let's break a video apart",
                     vcId: "rootVc",
                     title: "Break Apart")
    
    
    static let breakApart =
        TrainingStep(storyboard: "Tr_BreakApart",
                     description: "Let's break a video apart",
                     vcId: "breakApart",
                     title: "Break Apart")
    
    
    static let definition =
        TrainingStep(storyboard: "Tr_Definition",
                     description: "How are motion graphics videos created?",
                     vcId: "rootVc",
                     title: "What is")
    
    
    
    static let script =
        TrainingStep(storyboard : "Tr_Script",
                     description: "How to write scripts for videos?",
                     vcId: "rootVc",
                     title: "Script")
        
    static let graphics =
        TrainingStep(storyboard : "Tr_Graphics",
                     description: "How to assemble pieces into a shot?",
                     vcId: "rootVc",
                     title: "Graphics")
    
    static let collaboration =
        TrainingStep(storyboard : "Tr_Collaboration",
                     description: "How to work with others on a project?",
                     vcId: "rootVc",
                     title: "Collaboration")
    
    static let shotlist =
        TrainingStep(storyboard : "Tr_Shotlist",
                     description: "How is the script broken to separate shots?",
                     vcId: "rootVc",
                     title: "Shotlist")
    
    static let export =
        TrainingStep(storyboard : "Tr_Export",
                     description: "How to export the project as a final video?",
                     vcId: "rootVc",
                     title: "Export")
    
    
    static let motion =
        TrainingStep(storyboard : "Tr_Motion",
                     description: "How to add motion to objects of a shot?",
                     vcId: "rootVc",
                     title: "Motion")
    
    static var trainings : [TrainingStep] = [definition,
                                             script,
                                             graphics,
                                             collaboration,
                                             motion,
                                             shotlist,
                                             export]
}
