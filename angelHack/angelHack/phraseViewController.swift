//
//  phraseViewController.swift
//  angelHack
//
//  Created by Bruno F. de Almeida on 16/04/16.
//
//

import UIKit
import CoreData

class phraseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var frases = [NSManagedObject]()
    var tagButton = 0
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if tagButton == 0
        {
            saveFrase("ElaSeMudou")
            self.navigationItem.title = "Ajuda"
        }
        if tagButton == 1
        {
            saveFrase("EuGostoDeMontarACavalo")
            self.navigationItem.title = "Compras"
        }
        if tagButton == 2
        {
            saveFrase("EUNaoSeiNadar")
            self.navigationItem.title = "Esportes"
        }
        
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.view.backgroundColor = bgColor
        self.tableView.backgroundColor = bgColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        //1
//        let appDelegate =
//            UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        let fetchRequest = NSFetchRequest(entityName: "Phrase")
//        
//        //3
//        do {
//            let results =
//                try managedContext.executeFetchRequest(fetchRequest)
//            frases = results as! [NSManagedObject]
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
//    }
    
    
    func saveFrase(frase: String) {
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Phrase", inManagedObjectContext:managedContext)
        
        let phrase = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        phrase.setValue(frase, forKey: "phrase")
        
        //4
        do {
            try managedContext.save()
            //5
            frases.append(phrase)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ResultCategory" {
            let segueToCategory = segue.destinationViewController as! resultViewController
            
            if tagButton == 0
            {
                segueToCategory.frase = "Ela se mudou."
            }
            if tagButton == 1
            {
                segueToCategory.frase = "Eu gosto de montar a cavalo."
            }
            if tagButton == 2
            {
                segueToCategory.frase = "Eu não sei nadar."
            }
        }
    }
    
    @IBAction func btnTable(sender: AnyObject) {
        self.performSegueWithIdentifier("ResultCategory", sender: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return frases.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "PhraseTableCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PhraseTableViewCell
        
        let frase = frases[indexPath.row]
        
        let name = frase.valueForKey("phrase") as! String
        
        let image = UIImage(named: name)
        
        cell.backgroundColor = bgColor
        cell.signImage.image = image
        
        cell.scroll.contentSize = CGSize(width: cell.signImage.bounds.width, height: cell.signImage.bounds.height)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
    }

}