//
//  BlogPVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/9/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit

class BlogPVC: UIViewController, UIPageViewControllerDataSource {

    
    var pages = [UIViewController]()
    var pageViewController : UIPageViewController?
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPages()
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController!.setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height);
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! BlogContentVC).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! BlogContentVC).pageIndex
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if (index == self.pages.count) {
            return nil
        }
        
        return viewControllerAtIndex(index: index)
    }

    
    func viewControllerAtIndex(index: Int) -> UIViewController?
    {
        if self.pages.count == 0 || index >= self.pages.count
        {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let pageContentViewController = pages[index]
        currentIndex = index
        
        return pageContentViewController
    }
    
    
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }

    
        
    

    
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setUpPages() {
        
        let page1: BlogContentVC! = BlogContentVC()
        page1.pageIndex = 0
        page1.view.backgroundColor = UIColor.blue
        let page2: BlogContentVC! = BlogContentVC()
        page2.pageIndex = 1
        page2.view.backgroundColor = UIColor.red
        let page3: BlogContentVC! = BlogContentVC()
        page3.pageIndex = 2
        page3.view.backgroundColor = UIColor.brown
        
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
    }

}
