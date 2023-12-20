import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelRandom: UILabel!
    @IBOutlet weak var slider: UISlider!
    var targetValue: Int = 0
    var totalPoints: Int = 0
    var rounds:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound () {
        targetValue = Int.random(in: 1...100)
        labelRandom.text = String(targetValue)
        
        slider.value = 50
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        view.layer.add(transition, forKey: nil)
    }
    @IBOutlet weak var calcularOfPoints: UILabel!
    
    @IBOutlet weak var round: UILabel!
    
    @IBAction func showAlert(_ sender: Any) {
        
        let currentValue = lroundf(slider.value)
        var diference: Int = abs(currentValue - targetValue)
        let title:String
        var resultOfGuessedNumber = (100 - diference)
        
        if diference == 0 {
            title = "Good job"
            resultOfGuessedNumber += 100
        }else if (diference <= 5){
            title = "Pretty good!"
            if(diference <= 3){
                resultOfGuessedNumber += 50
            }
        }else if (diference <= 10){
            title = "Not bad kid!"
        }else{
            title = "Try again to be better"
        }
        
        
        totalPoints = totalPoints + resultOfGuessedNumber
        calcularOfPoints.text = String(totalPoints)
        
        let message = "Ваше значення містить \(currentValue) балів \n бали котрі ви отримаєте за цей хід \(resultOfGuessedNumber)"
        
        let alertWindow = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.newRound()} 
        )
        alertWindow.addAction(action)
        
        present(alertWindow, animated: true)
        
        rounds = rounds + 1
        round.text = String(rounds)
        

    }

    @IBAction func StartPlayingAgain(_ sender: Any) {
        rounds = 0
        totalPoints = 0
        round.text = String(1)
        calcularOfPoints.text = String(0)
        newRound()
    }
}

