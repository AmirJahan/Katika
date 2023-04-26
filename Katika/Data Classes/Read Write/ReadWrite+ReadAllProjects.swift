import UIKit

extension ReadWrite
{
    class func readAllProjects ()
    {
        // empty my projects
        AppData.projects = []
        
        let documentsDirectoryURL =
            try! FileManager.default.url(for: .documentDirectory,
                                         in: .userDomainMask,
                                         appropriateFor: nil, create: true)
        
        
        print (documentsDirectoryURL)
        
        
        let subDirs = documentsDirectoryURL.subDirectories
        
        for each in subDirs
        {
            let path = each.absoluteString
            
            let comps = path.components(separatedBy: "/")
            
            let projectTitle = comps[comps.count - 2]
            
            if let project = readProjectWithTitle(title: projectTitle)
            {
            
                AppData.projects.append(project)
                
//                for shot in project.shots
//                {
//                    for art in shot.artworkSet.artworks
//                    {
//                        print ("locked in read is : \(art.locked)")
//                    }
//                }
            }
        }
        

        
        
        
        print ("readAllProjects: we read \(AppData.projects.count) projects")
         
    }
    
    
    
    
}
