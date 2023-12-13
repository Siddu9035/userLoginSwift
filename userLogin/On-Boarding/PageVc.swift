//
//  PageVc.swift
//  userLogin
//
//  Created by siddappa tambakad on 12/12/23.
//

import UIKit

class PageVc: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pages: [UIViewController] = []
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        onBoardingPages()
        setupPageControl()
       
    }
    
    func setupPageControl() {
            let pageControlHeight: CGFloat = 100

            pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - pageControlHeight, width: UIScreen.main.bounds.width, height: pageControlHeight))
            pageControl.numberOfPages = pages.count
            pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor(named: "myColor1")// Current page color

            // Add UIPageControl to the UIPageViewController's view
            view.addSubview(pageControl)
        }
    
    func onBoardingPages() {
        //initialize the viewcontrollers
        let identifiers = ["screen1", "screen2", "screen3", "screen4"]
        
        //add the screens when they are slided
        for identifier in identifiers {
            if let page = storyboard?.instantiateViewController(withIdentifier: identifier) {
                pages.append(page)
            }
        }
        //set the viewcontrollers for the apeareance of first page
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
    }
    //fun to come back to previous screen
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 {
            return pages[currentIndex - 1]
        } else {
            return nil
        }
    }
    //func to go to next page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return nil
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if let currentViewController = pageViewController.viewControllers?.first,
                let currentIndex = pages.firstIndex(of: currentViewController) {
                pageControl.currentPage = currentIndex
            }
    }
}
