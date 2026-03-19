//
//  ViewController.swift
//  UIKit-Assignment2
//
//  Created by Malik Muhammad on 3/18/26.
//

import UIKit

class ViewController: UIViewController {
    
    var images: [UIImage] = [
        UIImage(named: "Lion") ?? UIImage(),
        UIImage(named: "Tiger") ?? UIImage(),
        UIImage(named: "Cheetah") ?? UIImage()
    ]

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
//        pageChanged(pageControl)
        // Do any additional setup after loading the view.
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
        pageControl.currentPage = index
//        pageChanged(pageControl)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    
    


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = images[indexPath.row]

            if indexPath.row == 0 {
                name.text = "Lion"
                info.text = "The lion is a powerful big cat sometimes found in parts of the Sahara Desert, where prey is scarce. In this harsh environment, lions rely on oases and adapted hunting strategies to survive. They are social animals, often living in small prides even in desert conditions."
            } else if indexPath.row == 1 {
                name.text = "Tiger"
                info.text = "Tigers are powerful big cats, though they do not naturally live in the Sahara Desert. If a tiger were in this harsh environment, it would face extreme heat, scarce water, and very little prey. Tigers are solitary hunters, relying on stealth and strength to catch food."
            } else {
                name.text = "Cheetah"
                info.text = "The cheetah is the fastest land animal, though it rarely lives in the Sahara Desert. In this harsh environment, it would face extreme heat, scarce water, and very little prey. Cheetahs rely on their speed and stealth to hunt, but desert conditions make survival challenging."
            }
            
        }
       
        
        
        return cell
    }
    
    
}

