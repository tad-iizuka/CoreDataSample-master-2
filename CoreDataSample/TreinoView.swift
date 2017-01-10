//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Tadashi on 9/20/16.
//  Copyright © 2016 T@d. All rights reserved.
//

import UIKit
import CoreData

class TreinoView: UIViewController, UITableViewDataSource, UITableViewDelegate {

	var item = [Treino]()

	@IBOutlet var tableView: UITableView!

	@IBAction func removeAllData(_ sender: AnyObject) {

		if item.count != 0 {

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
				self.item = [Treino]()
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
	}

	@IBAction func addData(_ sender: AnyObject) {

		let alert: UIAlertController =
			UIAlertController(title: "Input", message: "Name", preferredStyle:  UIAlertControllerStyle.alert)
		let defaultAction: UIAlertAction =
			UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
			(action: UIAlertAction!) -> Void in

			let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
			let treino = Treino(context: context)
			let textField = alert.textFields![0] as UITextField
			if textField.text != "" {
				treino.name = textField.text
			} else {
				treino.name = String(self.item.count+1)
			}
			treino.date = NSDate()

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
	
		let fetchRequest: NSFetchRequest<Treino> = Treino.fetchRequest()
		do {
			self.item = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
		} catch {
			print(String(format: "Error %@: %d",#file, #line))
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.tableFooterView = UIView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == "ExercicioView" {
			let exercicioView:ExercicioView = segue.destination as! ExercicioView
			exercicioView.treino1 = item[(self.tableView.indexPathForSelectedRow?.row)!]
			exercicioView.title = item[(self.tableView.indexPathForSelectedRow?.row)!].name
		} else if segue.identifier == "AllExercicioView" {
			let exercicioView:ExercicioView = segue.destination as! ExercicioView
			exercicioView.treino1 = nil
		}
    }
}
