//
//  ContainerVC.swift
//  PageViewController
//
//  Created by A_Z on 6/30/22.
//  Copyright © 2022 AliZ. All rights reserved.
//

import UIKit

class ContainerVC: UIPageViewController ,UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    
    var arrContainer = [UIViewController]()
    var pageController = UIPageControl()
    override func viewDidLoad() {
        super.viewDidLoad()

                                         // using when mulite Storyboard
//        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1")
//        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page2")
//        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page3")
//        let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "page4")
//
//        arrContainer.append(vc1!)
//        arrContainer.append(vc2!)
//        arrContainer.append(vc3!)
//        arrContainer.append(vc4!)
        
                                      // using when one Storyboard
        let VC1 = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! ViewController
        VC1.pagetitle = "Frist UI"
        VC1.pageDescrption = "My Description 1 and My Description 1 and My Description 1 and My Description 1 and My Description 1 and My Description 1 and My Description 1"
        VC1.pageColor = #colorLiteral(red: 0.9670919776, green: 0.6625588536, blue: 0.1867836118, alpha: 1)
        
        let VC2 = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! ViewController
        VC2.pagetitle = "Second UI"
        VC2.pageDescrption = "My Description 2 and My Description 2 and My Description 2 and My Description 2 and My Description 2 and My Description 2 and My Description 1"
        VC2.pageColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        let VC3 = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! ViewController
        VC3.pagetitle = "Thrid UI"
        VC3.pageDescrption = "My Description 3 and My Description 3 and My Description 3 and My Description 3 and My Description 3 and My Description 3 and My Description 1"
        VC3.pageColor = #colorLiteral(red: 0.1730339656, green: 0.0398540521, blue: 0.3415886739, alpha: 1)
        
        arrContainer.append(VC1)
        arrContainer.append(VC2)
        arrContainer.append(VC3)
        
        delegate = self
        dataSource = self
        addPageController()
        
        if let FirstVC = arrContainer.first {
            setViewControllers([FirstVC], direction: .forward, animated: true, completion: nil)
        }

    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // L T R
//        guard let currentIndex = arrContainer.firstIndex(of: viewController) else {
//            return nil
//        }
//        let BeforIndex = currentIndex - 1
//        guard BeforIndex >= 0 else{
//            return nil
//            //return arrContainer.last
//        }
//        return arrContainer[BeforIndex]
        // R T L
        guard let CurrentIndex = arrContainer.firstIndex(of: viewController) else {
            return nil
        }
        let AftterIndex = CurrentIndex + 1
        guard AftterIndex < arrContainer.count else{
            return nil
            //return arrContainer.first
        }
        return arrContainer[AftterIndex]
        }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // L T R
//        guard let CurrentIndex = arrContainer.firstIndex(of: viewController) else {
//            return nil
//        }
//        let AftterIndex = CurrentIndex + 1
//        guard AftterIndex < arrContainer.count else{
//            return nil
//            //return arrContainer.first
//        }
//        return arrContainer[AftterIndex]
        // R T L
        guard let currentIndex = arrContainer.firstIndex(of: viewController) else {
            return nil
        }
        let BeforIndex = currentIndex - 1
        guard BeforIndex >= 0 else{
            return nil
            //return arrContainer.last
        }
        return arrContainer[BeforIndex]
    }
    
    
    func addPageController () {
        self.pageController = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 75 , width: UIScreen.main.bounds.width, height: 50))
        self.pageController.numberOfPages = arrContainer.count
//        self.pageController.currentPage = 0                       //    LTR
        self.pageController.currentPage = arrContainer.count - 1   //     RTL
        self.pageController.tintColor = UIColor.white
        self.pageController.currentPageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.pageController.pageIndicatorTintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        self.view.addSubview(pageController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageCurrentViewController = pageViewController.viewControllers![0]
//        self.pageController.currentPage = arrContainer.firstIndex(of: pageCurrentViewController)!                              // LTR
        self.pageController.currentPage = (arrContainer.count - 1 ) - arrContainer.firstIndex(of: pageCurrentViewController)!   // RTL
    }

    
}
