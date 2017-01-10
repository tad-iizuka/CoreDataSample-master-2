//
//  SerieView.swift
//  CoreDataSample
//
//  Created by Nelson on 9/1/2017.
//  Copyright © 2017 T@d. All rights reserved.
//


import UIKit
import CoreData

class SerieView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public var treino : Treino? = nil
    public var exercicio : Exercicio? = nil
    
    var item = [Serie]()
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func removeAllData(_ sender: AnyObject) {
        
        let alert: UIAlertController =
            UIAlertController(title: "Warning!", message: "Remove all data?", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction =
            UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                for obj in self.item {
                    context.delete(obj)
                }
                do {
                    try context.save()
                } catch {
                    print(String(format: "Error %@: %d",#file, #line))
                }
                self.item = [Serie]()
                self.tableView.reloadData()
            })
        let cancelAction: UIAlertAction =
            UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:{
                (action: UIAlertAction!) -> Void in
            })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addData(_ sender: AnyObject) {
        
        let alert: UIAlertController =
            UIAlertController(title: "Input", message: "Name", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction =
            UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                var serie = Serie(context: context)
                let textField1 = alert.textFields![0] as UITextField
                if textField1.text != "" {
                    serie.name = textField1.text
                } else {
                    serie.name = String(self.item.count+1)
                }
                serie.date = NSDate()
                self.treino?.addToSerie(serie)
                
//                let context2 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                serie = Serie(context: context)
                let textField2 = alert.textFields![0] as UITextField
                if textField2.text != "" {
                    serie.name = textField2.text
                } else {
                    serie.name = String(self.item.count+1)
                }
                serie.date = NSDate()
                self.exercicio?.addToSerie(serie)
                
                do {
                    try context.save()
                } catch {
                    print(String(format: "Error %@: %d",#file, #line))
                }
                
                self.loadCoreData()
                self.tableView.reloadData()
            })
        let cancelAction: UIAlertAction =
            UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:{
                (action: UIAlertAction!) -> Void in
            })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        alert.addTextField(configurationHandler: {(text:UITextField!) -> Void in
        })
        present(alert, animated: true, completion: nil)
    }
    
    func loadCoreData() {
        
        let fetchRequest: NSFetchRequest<Serie> = Serie.fetchRequest()
        if self.treino != nil {
            fetchRequest.predicate = NSPredicate(format: "treino = %@", self.treino!)
        }
//        let fetchRequest: NSFetchRequest<Serie> = Serie.fetchRequest()
        if self.exercicio != nil {
            fetchRequest.predicate = NSPredicate(format: "exercicio = %@", self.exercicio!)
        }
        do {
            item = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(String(format: "Error %@: %d",#file, #line))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadCoreData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = item[indexPath.row].name
        cell.detailTextLabel!.text = String(describing: item[indexPath.row].date!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let alert: UIAlertController =
                UIAlertController(title: "Warning!", message: "Remove data?", preferredStyle:  UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction =
                UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                    (action: UIAlertAction!) -> Void in
                    
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    context.delete(self.item[indexPath.row])
                    do {
                        try context.save()
                    } catch {
                        print(String(format: "Error %@: %d",#file, #line))
                    }
                    
                    self.loadCoreData()
                    
                    tableView.deleteRows(at: [indexPath], with: .fade)
                })
            let cancelAction: UIAlertAction =
                UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:{
                    (action: UIAlertAction!) -> Void in
                    self.tableView.reloadData()
                })
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            
        } else if editingStyle == .insert {
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    
}
