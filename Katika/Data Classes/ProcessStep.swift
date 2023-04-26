import Foundation

enum StepLongEnum : String
{
    case Script
    case Shotlist
    case Graphics
    case Export
}

enum StepAcronymEnum : String
{
    case Sc
    case Sh
    case G
    case E
}

struct ProcessStep
{
    var levelName: StepLongEnum
    var description: String
    var levelAcronym: StepAcronymEnum
    var selected: Bool
    var trainings : [TrainingStep]?
    var storyboardName: String
    var viewControllerId: String
}






