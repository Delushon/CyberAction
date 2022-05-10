//
//  HistoryViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var historiesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historiesCollectionView.delegate = self
        historiesCollectionView.dataSource = self
        historiesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        historiesCollectionView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellWithReuseIdentifier: "HistoryCell")
    }

}

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FictiveData.instance.histories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = historiesCollectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        cell.setup(history: FictiveData.instance.histories.sorted(by: { h1, h2 in
            h1.date > h2.date
        })[indexPath.item])
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.9, height: 35)//UIScreen.main.bounds.height * 0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Загрузка следующих
    }
    
    
}
