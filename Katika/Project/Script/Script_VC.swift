import UIKit
import Speech

class Script_VC: UIViewController,
    SFSpeechRecognizerDelegate
{
    @IBOutlet weak var recordPauseButton: UIButton!
    @IBOutlet weak var recordTimeCounter: UILabel!
    @IBOutlet weak var recordingsTableView: UITableView!
    var currentRecordingName = ""
    
    
    @IBOutlet weak var scriptTextView: UITextView!
    let textViewPlaceholder = "Write your script here...."
    var scriptIntextView: String?
    
    //    let labelsFont: UIFont = UIFont(name: "Menlo", size: 10.0)!
    
    var recording = false
    var recordingTime : Float = 0.0
    var recordingTimer : Timer?
    var recorder: AVAudioRecorder?
    var player: AVAudioPlayer?
    var session: AVAudioSession?
    
    var processPopover = ProcessSidebar_VC()
    
    var attempt = 0
    
    
    // Title
    @IBOutlet weak var titleTextField: UITextField!
    
    // details
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var commentsBadge: UILabel!

    @IBOutlet weak var popBackButton: UIButton!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scriptTextView.delegate = self
        titleTextField.delegate = self
        
        let myTapGesture = UITapGestureRecognizer(target: self,
                                                  action: #selector(dismissAll))
        self.view.addGestureRecognizer(myTapGesture)
        
        
                
        // MARK: Recording
        session = AVAudioSession.sharedInstance()
        
        do {
            try session?.setCategory(.playAndRecord,
                                     mode: .spokenAudio, options: [])
            
            try session?.setActive(true)
            
            session?.requestRecordPermission { (res) in
                
                // runs the first time?
            }
        }
        catch
        {
            // failed to record!
        }
        recordingsTableView.delegate = self
        recordingsTableView.dataSource = self
        
        styleRecordButton()
        recordTimeCounter.isHidden = true
        
//        styleTextField()
        
        loadComments ()

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        // this is needed for when we go back and forth between Script and others
        AppData.curProject?.scriptChanged = false
        
        
        if let script = AppData.curProject?.script
        {
            scriptTextView.text = script
//            countScriptWords ()
        }
        else
        {
            scriptTextView.text = textViewPlaceholder
        }
        
        
        
        if let project = AppData.curProject
        {
            titleTextField.text = project.title
            titleTextField.isEnabled = false
            ReadWrite.fetchProjectAssets()
            
            
            
        }
        else
        {
            titleTextField.text = ""
        }
        
        prepareProcess ()
        
    }
}





