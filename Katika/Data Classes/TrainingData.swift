import Foundation


class TrainingData
{
    static let shared = TrainingData ()

    
//    var trainings : Array<TrainingStep> = []
    
    static var trainingsStoriesArr : Array<Project> = []

    
    static func prepare ()
    {
        let proj = Project(title: "How do Computers Read Code?")
        proj.keywords = ["Software",
                          "Binary",
                          "Zero and One",
                          "Assembly",
                          "first",
                          "programming",
                          "class",
                          "idea",
                          "compiler",
                          "prrogram",
                          "computer",
                          "version",
                          "inputs",
                          "outputs",
                          "magically",
                          "generated",
                          "complex",
                          "machine"]
        
        trainingsStoriesArr.append(proj)
    }
    
    
    static func fetchTitle (sbName: String) -> String
    {
        for i in 0..<Training.trainings.count
        {
            if Training.trainings[i].storyboard == sbName
            {
                return Training.trainings[i].title
            }
        }
        return "What is this?"
    }

    
    
//    let howAreMgsCreated = TrainingStep(trainingSb : "Training_HowAreMgsCreated",
//                                       trainingTitle: "How are motion graphics videos created?",
//                                       viewControllerId: "rootVc",
//                                       shotTitle: "Script Writing")
//
//   let shotDescriptions = TrainingStep(trainingSb : "Training_Description",
//               trainingTitle: "What are shot descriptions?",
//               viewControllerId: "rootVc",
//               shotTitle: "Script Writing")
//
//    let stories = TrainingStep(trainingSb : "Training_Stories",
//    trainingTitle: "How to write stories?",
//    viewControllerId: "rootVc",
//    shotTitle: "Script Writing")
//
//
//
//
//
//             let shotlist = TrainingStep(trainingSb : "Training_ShotList",
//                                               trainingTitle: "How do shot scripts make the story?",
//                                               viewControllerId: "rootVc",
//                                               shotTitle: "Script Writing")
//
//         let voiceover = TrainingStep(trainingSb : "Training_VoiceMusic",
//                                                trainingTitle: "How to record voice-over and add music?",
//                                                viewControllerId: "rootVc",
//                                                shotTitle: "Vocieover")
//
//         let graphics = TrainingStep(trainingSb : "Training_Assemble_Graphics",
//                                               trainingTitle: "How to assemble a shot with artworks?",
//                                               viewControllerId: "rootVc",
//                                               shotTitle: "Assembling Graphics")
//
//         let artwork = TrainingStep(trainingSb : "Training_Create_Artwork",
//                                              trainingTitle: "How to create artworks?",
//                                              viewControllerId: "rootVc",
//                                              shotTitle: "Artworks")
//
//         let transitions = TrainingStep(trainingSb : "Training_Transitions",
//                                                  trainingTitle: "How to add transitions between shots?",
//                                                  viewControllerId: "rootVc",
//                                                  shotTitle: "Transitions")
//
//         let collaborate = TrainingStep(trainingSb : "Training_Collaborate",
//                                                  trainingTitle: "How to invite collaborators to a project?",
//                                                  viewControllerId: "rootVc",
//                                                  shotTitle: "Collaboration")
//
//         let export = TrainingStep(trainingSb : "Training_Export",
//                                             trainingTitle: "How to export videos out?",
//                                             viewControllerId: "rootVc",
//                                             shotTitle: "Export a Video")
//
//
//    init()
//    {
//        trainings.append(howAreMgsCreated)
//        trainings.append(shotlist)
//        trainings.append(stories)
//        trainings.append(shotDescriptions)
//        trainings.append(voiceover)
//        trainings.append(graphics)
//        trainings.append(artwork)
//        trainings.append(transitions)
//        trainings.append(collaborate)
//        trainings.append(export)
//    }
    
    

}
