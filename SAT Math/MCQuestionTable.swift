//
//  MCQuestionTable.swift
//  SAT Math
//
//  Created by Adam Buys on 6/18/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import jot

class MCQuestionTable: UITableViewController, JotViewControllerDelegate {
    
    let drawing = JotViewController()
    
    var index : Int?
    var problem = problem1
    
    var multiplechoices : [MCChoice] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = 120
        // tableView.rowHeight = UITableViewAutomaticDimension
        // tableView.estimatedRowHeight = 200
        tableView.separatorColor = UIColor.clear
        tableView.separatorStyle = .none
        
        
        
        if let index = self.index {
            print(index)
            
        }
        nc.addObserver(self, selector: #selector(setUpDrawing), name: Notification.Name("drawOn"), object: nil)
        
        
      setUpMCChoices()
      
    }
    
 
    
    func setUpMCChoices() {
        
        let a = MCChoice(letter: "A", latexString: problem.mcA!.str, correct: problem.mcA!.correct)
        multiplechoices.append(a)
        
        let b = MCChoice(letter: "B", latexString: problem.mcB!.str, correct: problem.mcB!.correct)
        multiplechoices.append(b)
        
        let c = MCChoice(letter: "C", latexString: problem.mcC!.str, correct: problem.mcC!.correct)
        multiplechoices.append(c)
        
        let d = MCChoice(letter: "D", latexString: problem.mcD!.str, correct: problem.mcD!.correct)
        multiplechoices.append(d)
        
        if problem.choicesCount == 5 && problem.mcE != nil {
            let e = MCChoice(letter: "E", latexString: self.problem.mcE!.str, correct: self.problem.mcE!.correct)
            self.multiplechoices.append(e)
        }
        
    }
    
    func setUpDrawing() {
        
        self.tableView.isScrollEnabled = false
        nc.post(name: Notification.Name("disableScroll"), object: nil)
     
        self.drawing.delegate = self
        self.addChildViewController(drawing)
        self.view.addSubview(drawing.view)
        self.drawing.didMove(toParentViewController: self)
        self.drawing.view.frame = self.view.frame
        self.drawing.state = JotViewState.drawing
        self.drawing.view.backgroundColor = UIColor.clear
        
        addEndButton()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3 // 0: top cell, 1:
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return problem.partsCount
        } else { return problem.choicesCount}
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath[0] == 0 { let cell = tableView.dequeueReusableCell(withIdentifier: "topcellidentifier", for: indexPath) as! TopTVC
            cell.problemNum.text! = problem.numInSet
            return cell
        
        }
        
        else {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "Ma1identifier", for: indexPath) as! Ma1TVC
            cell.setUpCell(mc: multiplechoices[indexPath.row])
        
            return cell
        }
        

    }
    
    func addEndButton() {
        
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        btn.backgroundColor = UIColor.brown
        btn.addTarget(self, action: #selector(MCQuestionTable.endDrawing), for: UIControlEvents.touchUpInside)
        self.drawing.view.addSubview(btn)
        
    }
    
    func endDrawing() {
        
        self.tableView.isScrollEnabled = true
        
        self.drawing.clearAll()
        let vc = self.childViewControllers.last!
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
        nc.post(name: Notification.Name("enableScroll"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
