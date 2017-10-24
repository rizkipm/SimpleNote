//
//  AddTaskViewController.swift
//  Simple Note
//
//  Created by Rizki Syaputra on 10/24/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var etNameTask: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnSaveTask(_ sender: Any) {
        //deklarasi context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //deklarasi task
        let nameTask = Task(context: context) //deklarasi nameTask sebagai konteks dari entiti Task
        nameTask.name_task = etNameTask.text // mendeklarasikan bahwa nameTask.name_task itu isinya dari etNameTask.text
        
        //proses penyimpanan data ke core data
        //mengecek apakah nilai dari etTask adalah kosong atau tidak
        if etNameTask.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task can not be empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //ketika kondisi teks taks nya tidak kosong
            //data dismpan ke core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            _  = navigationController?.popViewController(animated: true)
            
            //mencetak kalau data berhasil ditambahkan
            print("Data berhasil disimpan")
        }
        
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
