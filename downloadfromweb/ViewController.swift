//
//  ViewController.swift
//  downloadfromweb
//
//  Created by Student-001 on 30/12/19.
//  Copyright © 2019 felix It. All rights reserved.
//

import UIKit
//https://i.pinimg.com/originals/d6/64/a4/d664a4e1a33c09e90e73ce32d49c6ac0.jpg
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var imageview: UIImageView!
    @IBAction func button1(_ sender: UIButton) {
        let queue = DispatchQueue(label: "", attributes: .concurrent)
        queue.async {
            self.downloadfromweb()
        }
    }
        func downloadfromweb()
        {
        let str = "https://i.pinimg.com/originals/d6/64/a4/d664a4e1a33c09e90e73ce32d49c6ac0.jpg"
        
        let url = URL(string: str)
        let session = URLSession(configuration:.default)
        let dataTask = session.dataTask(with:url!)
        {(data,response,error)in
            guard let data = data else{
                return
            }
            
            let image = UIImage(data: data)
            self.indicator.startAnimating()
            self.indicator.stopAnimating()
            DispatchQueue.main.async{
                
                self.imageview.image = image
                
            }
            }
        dataTask.resume()
        
    }
    
    
    @IBAction func button2(_ sender: UIButton) {
        let operationQueue = OperationQueue()
        let operation1 : BlockOperation = BlockOperation (block:
        {
        let str = "https://wallpapercave.com/wp/F0lBbIW.jpg"
        
        let url = URL(string: str)
        let session = URLSession(configuration:.default)
        let dataTask = session.dataTask(with:url!)
        {(data,response,error)in
            guard let data = data else{
                return
            }
            let image = UIImage(data: data)
            self.indicator.stopAnimating()
            self.imageview.image = image
    }
    dataTask.resume()
})
        operationQueue.addOperation(operation1)

}
}
