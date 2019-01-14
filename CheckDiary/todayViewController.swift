//
//  todayViewController.swift
//  CheckDiary
//
//  Created by Lisa  on 2018/12/01.
//  Copyright © 2018年 Tomoyuki Hayakawa. All rights reserved.
//

import UIKit

class todayViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var day: Date!
    
    @IBOutlet var contentTextView: UITextView!
    
    @IBOutlet var cameraImageView: UIImageView!
    
    @IBOutlet var dekitayo: UIButton!
    @IBOutlet var mama: UIButton!
    @IBOutlet var sonnnani: UIButton!
    @IBOutlet var zenzen: UIButton!
    
    var saveData : UserDefaults = UserDefaults.standard
    
    
    var checked: UIImage = UIImage(named: "ひまわりの種.png")!
    var unchecked: UIImage = UIImage(named: "ひまわりの種(ガチ).png")!
    
    var checked2: UIImage = UIImage(named: "ひまわりの双葉.png")!
    var unchecked2: UIImage = UIImage(named: "ひまわりの双葉(ガチ).png")!
    
    var checked3: UIImage = UIImage(named: "ひまわり途中.png")!
    var unchecked3: UIImage = UIImage(named: "ひまわり途中(ガチ).png")!
    
    var checked4: UIImage = UIImage(named: "ひまわり茎.png")!
    var unchecked4: UIImage = UIImage(named: "ひまわり(ガチ).png")!
    
   
    
    var btn: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextView.text = saveData.object(forKey:  "content")as? String
        
        //zenzen.isHidden = false
        //sonnnani.isHidden = false
        //mama.isHidden = false
        //dekitayo.isHidden = false
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savememo() {
        
        // ユーザデフォルトから呼び出す
        var daysArray = saveData.array(forKey: "days") ?? []
        // 各保存したい値をまとめる
        let today = ["btn": btn, "image": UIImagePNGRepresentation(cameraImageView.image!)! as NSData, "text": contentTextView.text, "date": day] as [String : Any]
        // まとめた値を配列に入れる
        daysArray.append(today)
        // まとめた配列をユーザフォルトへ保存する
        saveData.set(daysArray, forKey: "days")
        
        //saveData.set(contentTextView.text, forKey: "title")
        contentTextView.resignFirstResponder()
        
    }
    
    // 保存後に自動で戻る
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //スタンプ押したり押さなかったり
    @IBAction func dekitayo(_ sender: Any) {
        
        dekitayo.setImage(checked4, for: .normal)
        mama.setImage(unchecked3, for: .normal)
        sonnnani.setImage(unchecked2, for: .normal)
        zenzen.setImage(unchecked, for: .normal)
        
        btn = 3
        
    }
    
    @IBAction func mama(_ sender: Any) {
        
        mama.setImage(checked3, for: .normal)
        dekitayo.setImage(unchecked4, for: .normal)
        sonnnani.setImage(unchecked2, for: .normal)
        zenzen.setImage(unchecked, for: .normal)
        
        btn = 2
    
    }
    
    @IBAction func sonnnani(_ sender: Any) {
        
        sonnnani.setImage(checked2, for: .normal)
        dekitayo.setImage(unchecked4, for: .normal)
        mama.setImage(unchecked3, for: .normal)
        zenzen.setImage(unchecked, for: .normal)
        
        btn = 1
    }
    
    @IBAction func zenzen(_ sender: Any){
        
        zenzen.setImage(checked, for: .normal)
        dekitayo.setImage(unchecked4, for: .normal)
        mama.setImage(unchecked3, for: .normal)
        sonnnani.setImage(unchecked2, for: .normal)
        
        btn = 0
        
    }
    
    //写真とるよ
    @IBAction func takePhoto() {
        
        //カエラが使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            //カメラ起動するよう
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            //カメラが使えない時はエラーがコンソールに出るよ
            print("error")
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true)
        
    }
    
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


