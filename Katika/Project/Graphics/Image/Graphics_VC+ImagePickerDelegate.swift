import UIKit

extension Graphics_VC:
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let pickedImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            addImage (img: pickedImg)
        }
        
        dismiss(animated: true, completion: nil)
    }
}

