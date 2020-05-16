
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progresssBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain();

    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionLabel();
    }
        
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!;
        let userGotItRigt = quizBrain.checkAnswer(userAnswer);
                
        if(userGotItRigt){
            sender.backgroundColor = UIColor.green;
        }else{
            sender.backgroundColor = UIColor.red;
        }
        
        quizBrain.nextQuestion();
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector:
            #selector(updateQuestionLabel), userInfo:nil,repeats: false);
    }
    
    @objc func updateQuestionLabel(){
        questionLabel.text = quizBrain.getQuestionText();
        retrieveAnswers();
        clearButtons();
        scoreLabel.text = "Score: \(quizBrain.getScore())";
        progresssBar.progress = quizBrain.getProgress();
    }
    
    func retrieveAnswers(){
        firstButton.setTitle(quizBrain.getAnswerText(0), for: .normal)
        secondButton.setTitle(quizBrain.getAnswerText(1), for: .normal)
        thirdButton.setTitle(quizBrain.getAnswerText(2), for: .normal)
    }
    
    func clearButtons(){
        firstButton.backgroundColor = UIColor.clear;
        secondButton.backgroundColor = UIColor.clear;
        thirdButton.backgroundColor = UIColor.clear;
    }
}

