import UIKit
import SnapKit

final class ColumnChart: UIView {
    
    private var timer: Timer?
    private var stopWatch: Timer?
    private var counter = 0
    private var timeString = ""
    private var previewCount = 0
    private var timeOfDurationOfAnimation: Double = 8
    
    private var stopWatchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 40.0)
        label.textColor = .white
        label.text = "00:00:00"
        return label
    }()
    
    private var differenceHearLevel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 48.0)
        label.textColor = UIColor(hexString: "#F9B7FF")
        return label
    }()
    
    public var playButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = UIColor(hexString: "#AAE4FF")
        button.layer.shadowColor = UIColor(hexString: "#00B2FF").cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
        button.layer.cornerRadius = 5
        let config = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        let playImage = UIImage(systemName: "play.fill", withConfiguration: config)
        button.setImage(playImage, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addingSubviews()
        self.setupConst()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addingSubviews() {
        self.addSubview(playButton)
        self.addSubview(stopWatchLabel)
        self.addSubview(differenceHearLevel)
    }
    
    // MARK: Delay before creating a column
    
    public func delayOfCreateColumn(_ isPlay: IsPlay) {
        
        timer?.invalidate()
        stopWatch?.invalidate()
        switch isPlay {
        case .play:
            timer = Timer.scheduledTimer(
                timeInterval: 0.7,
                target: self,
                selector: #selector(createColumn),
                userInfo: nil,
                repeats: true
            )
            stopWatch = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(timeCounter),
                userInfo: nil,
                repeats: true
            )
        case .pause:
            break
        }
    }
    
    // MARK: Creating a column (Lifecycle of column (create -> animation -> deinit))
    
    @objc private func createColumn() {
        let height = Int.random(in: 0...120)
        
        let heightCurrent = height - previewCount
        differenceHearLevel.text = String(format: "%+02d", heightCurrent)
        previewCount = height
        
        let column = UIView()
        column.bounds.size.width = 20 * Resources.Multipliers.multiplierX
        column.bounds.size.height = CGFloat(2.75 * Double(height)) // height of column on Screen
        
        let color = colorForColumn(height)
        column.layer.borderWidth = 20 * Resources.Multipliers.multiplierX
        column.layer.cornerRadius = 4
        column.layer.borderColor = color.0.cgColor
        column.layer.shadowColor = color.1.cgColor
        column.layer.shadowRadius = 15
        column.layer.shadowOpacity = 1
        
        self.addSubview(column)
        
        animationOfColumn(column, height)
    }
    
    private func colorForColumn(_ height: Int) -> (UIColor, UIColor) {
        
        var colorOfColumn = UIColor()
        var colorOfShadow = UIColor()
        
        switch height {
        case 0...13:
            colorOfColumn = Resources.ColorOfColumn.level1
            colorOfShadow = Resources.ColorOfShadow.level1
        case 14...26:
            colorOfColumn = Resources.ColorOfColumn.level2
            colorOfShadow = Resources.ColorOfShadow.level2
        case 27...40:
            colorOfColumn = Resources.ColorOfColumn.level3
            colorOfShadow = Resources.ColorOfShadow.level3
        case 41...54:
            colorOfColumn = Resources.ColorOfColumn.level4
            colorOfShadow = Resources.ColorOfShadow.level4
        case 55...68:
            colorOfColumn = Resources.ColorOfColumn.level5
            colorOfShadow = Resources.ColorOfShadow.level5
        case 69...82:
            colorOfColumn = Resources.ColorOfColumn.level6
            colorOfShadow = Resources.ColorOfShadow.level6
        case 83...96:
            colorOfColumn = Resources.ColorOfColumn.level7
            colorOfShadow = Resources.ColorOfShadow.level7
        case 97...110:
            colorOfColumn = Resources.ColorOfColumn.level8
            colorOfShadow = Resources.ColorOfShadow.level8
        case 111...120:
            colorOfColumn = Resources.ColorOfColumn.level9
            colorOfShadow = Resources.ColorOfShadow.level9
        default: break
        }
        
        return (colorOfColumn, colorOfShadow)
    }
    
    @objc private func animationOfColumn(_ column: UIView, _ height: Int) {
        
        let animation = CABasicAnimation()
        
        CATransaction.setCompletionBlock {
            self.removeColumn(column)
        }
        
        CATransaction.begin()
        
        animation.keyPath = "position.x"
        animation.fromValue = Resources.PositionOfAnimation.fromPositionX
        animation.toValue = Resources.PositionOfAnimation.toPositionX
        animation.duration = timeOfDurationOfAnimation
        column.layer.add(animation, forKey: "basic")
        column.layer.position = CGPoint(x: Resources.PositionOfAnimation.toPositionX, y: Resources.PositionOfAnimation.positionY(height))
        CATransaction.commit()
    }
    
    private func removeColumn(_ column: UIView) {
        column.removeFromSuperview()
    }
    
    // MARK: StopWatch
    
    @objc private func timeCounter() {
        counter += 1
        let time = secondsToHoursMinutesSeconds(seconds: counter)
        timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        stopWatchLabel.text = timeString
    }
    
    private func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    private func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    private func setupConst() {
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(780 * Resources.Multipliers.multiplierY)
            make.leading.equalToSuperview().offset(183 * Resources.Multipliers.multiplierX)
            make.bottom.equalToSuperview().inset(78 * Resources.Multipliers.multiplierY)
        }
        
        stopWatchLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(717 * Resources.Multipliers.multiplierY)
            make.leading.equalToSuperview().offset(120 * Resources.Multipliers.multiplierX)
        }
        
        differenceHearLevel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(184 * Resources.Multipliers.multiplierY)
            make.leading.equalToSuperview().offset(170 * Resources.Multipliers.multiplierX)
        }
    }
}
