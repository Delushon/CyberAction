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
    
}

extension DateViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FictiveData.instance.cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = datesCollectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! MonthCell
//        cell.setup(city: FictiveData.instance.cities[indexPath.item])
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.9, height: 350)//UIScreen.main.bounds.height * 0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        User.currentUser?.city = FictiveData.instance.cities[indexPath.item]
        navigationController?.popToRootViewController(animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Загрузка следующих
    }
    
    
}
