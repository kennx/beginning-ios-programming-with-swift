//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/17.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: class {
  func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController {
  
  weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
  
  var pageHeadings: [String] = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
  var pageImages: [String] = ["onboarding-1", "onboarding-2", "onboarding-3"]
  var pageSubHeadings: [String] = ["Pin your favorite restaurants and create your own food guide", "Search and locate your favourite restaurant on Maps", "Find restaurants shared by your friends and other foodies"]
  var currentIndex: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    delegate = self
    
    if let startingViewController = contentViewController(at: 0) {
      setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
    }
    // Do any additional setup after loading the view.
  }
  
  func forwardPage() {
    currentIndex += 1
    if let nextViewController = contentViewController(at: currentIndex) {
      setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}


extension WalkthroughPageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! WalkthroughContentViewController).index
    index -= 1
    
    return contentViewController(at: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! WalkthroughContentViewController).index
    index += 1
    
    return contentViewController(at: index)
  }
  
  func contentViewController(at index: Int) -> WalkthroughContentViewController? {
    if index < 0 || index >= pageHeadings.count {
      return nil
    }
    let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
    
    if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
      pageContentViewController.imageFile = pageImages[index]
      pageContentViewController.heading = pageHeadings[index]
      pageContentViewController.subHeading = pageSubHeadings[index]
      pageContentViewController.index = index
      
      return pageContentViewController
    }
    
    return nil
  }
  
  
}


extension WalkthroughPageViewController: UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    if completed {
      if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
        currentIndex = contentViewController.index
        
        walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
      }
    }
  }
}

