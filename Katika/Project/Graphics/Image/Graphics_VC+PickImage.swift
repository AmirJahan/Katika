import UIKit

extension Graphics_VC
{
    func pickImage (_ sender: UIButton)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let pickAlert = UIAlertController(title: "Add an Image",
                                          message: nil,
                                          preferredStyle: UIAlertController.Style.alert)
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
            
        {
            let cameraAction = UIAlertAction(title: "Camera",
                                             style: UIAlertAction.Style.default,
                                             handler:
                { (action) in
                    imagePicker.sourceType = UIImagePickerController.SourceType.camera;
                    self.present(imagePicker,
                                 animated: true,
                                 completion: nil)
            })
            pickAlert.addAction(cameraAction)
            
        }
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
            
        {
            
            
            let photoLibraryAction = UIAlertAction(title: "Photo Library",
                                                   style: UIAlertAction.Style.default,
                                                   handler:
                { (action) in
                    imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
                    self.present(imagePicker,
                                 animated: true,
                                 completion: nil)
            })
            
            
            pickAlert.addAction(photoLibraryAction)
        }
        
        pickAlert.addAction(UIAlertAction(title: "Cancel",
                                          style: UIAlertAction.Style.destructive,
                                          handler: nil))
        
        self.present(pickAlert,
                     animated: true,
                     completion: nil)
    }
}
