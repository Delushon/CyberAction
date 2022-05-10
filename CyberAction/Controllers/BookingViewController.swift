//
//  BookingViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class BookingViewController: UIViewController {

    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var placeholderButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    var selectedPlace: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesCollectionView.delegate = self
        placesCollectionView.dataSource = self
        placesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        placesCollectionView.register(UINib(nibName: "PlaceCell", bundle: nil), forCellWithReuseIdentifier: "PlaceCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkIsAuth()
        cityButton.setTitle(User.currentUser?.city.name, for: .normal)
        cityButton.titleLabel?.font = UIFont.systemFont(ofSize: 23)
        placesCollectionView.reloadData()
    }
    
    func checkIsAuth() {
        if User.currentUser != nil {
            hidePlaceholder()
            showPlacesInfo()
        } else {
            showPlaceholder()
            hidePlacesInfo()
        }
    }
    
    func hidePlaceholder() {
        placeholderButton.isHidden = true
        placeholderLabel.isHidden = true
    }
    
    func showPlaceholder() {
        placeholderButton.isHidden = false
        placeholderLabel.isHidden = false
    }
    
    func hidePlacesInfo() {
        cityButton.isHidden = true
        placesCollectionView.isHidden = true
    }
    
    func showPlacesInfo() {
        cityButton.isHidden = false
        placesCollectionView.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DateViewController else { return }
        destination.place = selectedPlace
    }

}

extension BookingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let user = User.currentUser {
            return user.city.places.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = placesCollectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        if let user = User.currentUser {
            cell.setup(place: user.city.places[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPlace = User.currentUser?.city.places[indexPath.item]
        performSegue(withIdentifier: "toDatePicker", sender: self)
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
