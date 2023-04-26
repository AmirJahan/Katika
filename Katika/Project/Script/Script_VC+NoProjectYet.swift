import UIKit

extension Script_VC
{
    func ifNoProject ()
    {
        if AppData.curProject == nil
        {
            let projectTitle = titleTextField.text!
            
            if projectTitle == ""
            {
                let alert = UIAlertController (title: "No Title",
                                               message: "Please Enter a Title for Your New Video", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ok",
                                              style: UIAlertAction.Style.default, handler: { (alert) in
                                                return
                }))
            }
            else
            {
                // if no current project
                let newProject = Project(title: projectTitle)
                
                let randomColor = UIColor.random
                let img = UIImage.imageWithColor(color: randomColor)
                let projectImageName = ReadWrite.saveImageAndGetName(img,
                                                                   projectTitle)
                
                newProject.projectImage = img
                newProject.mainImageName = projectImageName
                            
                AppData.projects.append( newProject)
                AppData.curProject = newProject
                
                
                
            }
        }
    }
    
}

