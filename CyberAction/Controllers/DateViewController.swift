//
//  DateViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    
    var place: Place?
    var selectedDate = Date()
    var iterator = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        datesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        datesCollectionView.register(UINib(nibName: "MonthCell", bundle: nil), forCellWithReuseIdentifier: "MonthCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addressLabel.text = place?.address
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TimeViewController else { return }
        destination.place = place
        destination.date = selectedDate
    }
    
}

extension DateViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FictiveData.instance.months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = datesCollectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! MonthCell
        setup(cell: cell, month: FictiveData.instance.months[indexPath.item])
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.9, height: 350)//UIScreen.main.bounds.height * 0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Загрузка следующих
    }
    
    func setup(cell: MonthCell, month: Month) {
        cell.monthNameLabel.text = month.name
        let stackViews = [cell.mondayStackView, cell.tuesdayStackView, cell.wednesdayStackView, cell.thursdayStackView, cell.fridayStackView, cell.saturdayStackView, cell.sundayStackView]
        iterator = month.firstDayOfWeek.index ?? 0
        putEmptyDaysToStartOfMonth(month.firstDayOfWeek.index ?? 0, stackViews: stackViews)
        
        for dayNumber in 1...month.daysCount {
            if iterator > 6 { iterator = 0}
            let label = UILabel()
            label.text = "\(dayNumber)"
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            let tap = MyTapGesture(target: self, action: #selector(toTime(_:)))
            tap.date = Calendar.current.date(from: DateComponents.init(year: month.numberOfYear, month: month.numberOfMonth, day: dayNumber)) ?? Date()
            label.addGestureRecognizer(tap)
            
            stackViews[iterator]?.addArrangedSubview(label)
            iterator += 1
        }
        
        putEmptyDaysToEndOfMonth(month.lastDayOfWeek.index ?? 0, stackViews: stackViews)
        
        print(month.name)
        print(month.numberOfYear)
        print(month.numberOfMonth)
        print(month.daysCount)
        print(month.firstDayOfWeek)
        print("-----------")
    }
    
    @objc func toTime(_ sender: MyTapGesture) {
        print(sender.date.dateString())
        selectedDate = sender.date
        performSegue(withIdentifier: "toTime", sender: self)
    }
    
    func putEmptyDaysToStartOfMonth(_ count: Int, stackViews: [UIStackView?]) {
        for (i, stackView) in stackViews.enumerated() {
            if i < count {
                let Label = UILabel()
                Label.text = " "
                stackView?.addArrangedSubview(Label)
            }
        }
    }
    
    func putEmptyDaysToEndOfMonth(_ count: Int, stackViews: [UIStackView?]) {
        for (i, stackView) in stackViews.enumerated() {
            if i > count {
                let Label = UILabel()
                Label.text = " "
                stackView?.addArrangedSubview(Label)
            }
        }
    }
    
    
}

class MyTapGesture: UITapGestureRecognizer {
    var date = Date()
}
