//
//  TimeViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timePackagesCollectionView: UICollectionView!
    
    var place: Place?
    var date: Date?
    var pageControl = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePackagesCollectionView.delegate = self
        timePackagesCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        timePackagesCollectionView.collectionViewLayout = layout
        timePackagesCollectionView.register(UINib(nibName: "TimeCell", bundle: nil), forCellWithReuseIdentifier: "TimeCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addressLabel.text = place?.address
        dateLabel.text = date?.dateString()
    }
    
    @IBAction func bookingButtonAction(_ sender: UIButton) {
        let selectedTimePackage = FictiveData.instance.timePackages[pageControl]
        let alert = UIAlertController(title: "Бронирование", message: "Вы собираетесь забронировать на \(date?.dateString()) \(selectedTimePackage). Подтвердить?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Подтвердить", style: .default, handler: { _ in
            User.bookings.append(Booking(date: self.date ?? Date(), timePackage: selectedTimePackage))
            self.navigationController?.popToRootViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension TimeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FictiveData.instance.timePackages.count + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = timePackagesCollectionView.dequeueReusableCell(withReuseIdentifier: "TimeCell", for: indexPath) as! TimeCell
        if indexPath.item == 0 || indexPath.item == FictiveData.instance.timePackages.count + 1 {
            cell.timeLabel.text = ""
        } else {
            cell.timeLabel.text = FictiveData.instance.timePackages[indexPath.item-1].description
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 || indexPath.item == FictiveData.instance.timePackages.count + 1 {
            return CGSize(width: UIScreen.main.bounds.width / 2 - 60, height: 50)
        } else {
            return CGSize(width: 120, height: 50)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = Float(120)
            let targetXContentOffset = Float(targetContentOffset.pointee.x)
            let contentWidth = Float(timePackagesCollectionView.contentSize.width  )
            var newPage = Float(self.pageControl)

            if velocity.x == 0 {
                newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
            } else {
                newPage = Float(velocity.x > 0 ? pageControl + 1 : self.pageControl - 1)
                if newPage < 0 {
                    newPage = 0
                }
                if (newPage > contentWidth / pageWidth) {
                    newPage = ceil(contentWidth / pageWidth) - 1.0
                }
            }

            self.pageControl = Int(newPage)
            let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
            targetContentOffset.pointee = point
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Загрузка следующих
    }
    
    
}

