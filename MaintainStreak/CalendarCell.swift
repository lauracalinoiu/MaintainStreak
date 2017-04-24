//
//  CalendarCell.swift
//  MaintainStreak
//
//  Created by Laura Calinoiu on 24/03/2017.
//  Copyright © 2017 Laura Calinoiu. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    private var day: DayViewModel!
    
    private var colorfullViews = [LittleView]()
    var defaultEvents: [EventViewModel]!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var viewInCell: UIView!
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor(red: 84/255, green: 106/255, blue: 123/255, alpha: isSelected ? 1 : 0).cgColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addEvents() {
        guard colorfullViews.count == 0 else { return }
        var dx = 0
        var counter = 0
        let space = 3
        let littleViewWidth = 10
        let leading = 5
        
        for event in defaultEvents {
            dx = (littleViewWidth + space) * counter
            counter += 1
            let littleView = LittleView(frame: CGRect(x: leading + dx, y: 5, width: littleViewWidth, height: littleViewWidth))
            littleView.event = event
            self.viewInCell.addSubview(littleView)
            self.colorfullViews.append(littleView)
        }
        
    }
    
    func configure(day: DayViewModel){
        self.day = day
        
        for view in colorfullViews {
            view.backgroundColor = UIColor.white
        }
        
        for event in day.events {
            let viewColoredBecauseOfEvent = colorfullViews.filter{ $0.event! == event }
            viewColoredBecauseOfEvent.first?.backgroundColor = event.color
        }
        
        dateLabel.text = day.date.dayOfTheMonth
    }
}
