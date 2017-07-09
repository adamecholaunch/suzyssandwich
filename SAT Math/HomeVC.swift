//
//  HomeVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/9/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import SWRevealViewController

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavBar()
    }

    func setUpNavBar() -> Void {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain
            , target: nil, action: nil)
        
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], for: UIControlState.normal)
        
        let backBTN = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = backBTN
        
        
        if self.revealViewController() != nil {
            backBTN.target = self.revealViewController()
            backBTN.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
    }
    
    class ContainerView : UIViewController {
        @IBOutlet var myPageController: UIPageControl!
    }
    
    class MyPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var pages = [UIViewController]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.delegate = self
            self.dataSource = self
            
            let page1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "Page1ID")
            let page2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "Page2ID")
            let page3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "Page3ID")
            pages.append(page1)
            pages.append(page2)
            pages.append(page3)
            setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let currentIndex = pages.index(of: viewController)!
            if (currentIndex == 0) {
                return pages[currentIndex]
            }
            let previousIndex = abs((currentIndex - 1) % pages.count)
            //myPageControl.currentPage = previousIndex
            return pages[previousIndex]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let currentIndex = pages.index(of: viewController)!
            if (currentIndex == 2) {
                return pages[currentIndex]
            }
            let nextIndex = abs((currentIndex + 1) % pages.count)
            //myPageControl.currentPage = nextIndex
            return pages[nextIndex]
        }
        
        func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
            return pages.count
        }
        
        func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
            return 0
        }
        
    }

    
    
    
    
    
    
    
    
    
}
