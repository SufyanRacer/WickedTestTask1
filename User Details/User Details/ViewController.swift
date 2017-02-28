//
//  ViewController.swift
//  User Details
//
//  Created by grepruby on 22/02/17.
//  Copyright © 2017 Sufyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var informationTableView: UITableView!
    var picker: UIImagePickerController = UIImagePickerController()
    var user: User = User()
    var isDatePickerRequire: Bool = false
    
    @IBOutlet var tapGestureOnView: UITapGestureRecognizer!
    
    @IBOutlet weak var bottomSpacingContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationTableView.tableFooterView = UIView(frame: .zero)
        picker.delegate = self
        self.view.removeGestureRecognizer(tapGestureOnView)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }

    // MARK: TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDatePickerRequire {
            return 7
        } else {
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 151.0
        }
        if isDatePickerRequire && indexPath.row == 5 {
            return 139.0
        }
        else{
            return 70.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nullCell:UITableViewCell = UITableViewCell()
        
        if !isDatePickerRequire {
            if indexPath.row == 0 {
                let cell:PhotoCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")!as! PhotoCellTableViewCell
                user.image = cell.profileImageView!
                cell.profileImageView.layer.borderColor = UIColor.white.cgColor
                return cell
            }
            if indexPath.row == 1 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "NameIcon")
                cell.informationTextField.placeholder = "name"
                cell.informationTextField.text = user.name
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 2 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "EmailIcon")
                cell.informationTextField.placeholder = "email"
                cell.informationTextField.text = user.email
                cell.informationTextField.keyboardType = UIKeyboardType.emailAddress
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 3 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "PhoneIcon")
                cell.informationTextField.placeholder = "phone"
                cell.informationTextField.text = user.phoneNumber
                cell.informationTextField.keyboardType = UIKeyboardType.phonePad
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 4 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "CalendarIcon")
                cell.informationTextField.placeholder = "Date of Birth"
                cell.informationTextField.text = user.dobString
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 5 {
                let cell:GenderSelectionCell = tableView.dequeueReusableCell(withIdentifier: "GenderSelectionCell")!as! GenderSelectionCell
                cell.genderMaleButton.tag = 101
                cell.genderFemaleButton.tag = 102
                cell.genderMaleButton.layer.borderColor = UIColor.white.cgColor
                cell.genderFemaleButton.layer.borderColor = UIColor.white.cgColor
                if user.gender == "" {
                    cell.genderMaleButton.backgroundColor = UIColor.clear
                    cell.genderFemaleButton.backgroundColor = UIColor.clear
                } else {
                    if user.gender == "Male" {
                        cell.genderMaleButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
                        cell.genderFemaleButton.backgroundColor = UIColor.gray
                    } else {
                        cell.genderMaleButton.backgroundColor = UIColor.gray
                        cell.genderFemaleButton.backgroundColor = UIColor(red: 239/255, green: 62/255, blue: 62/255, alpha: 1.0)
                    }
                }
                
                return cell
            }
        } else {
            if indexPath.row == 0 {
                let cell:PhotoCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")!as! PhotoCellTableViewCell
                user.image = cell.profileImageView!
                return cell
            }
            if indexPath.row == 1 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "NameIcon")
                cell.informationTextField.placeholder = "name"
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 2 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "EmailIcon")
                cell.informationTextField.placeholder = "email"
                cell.informationTextField.keyboardType = UIKeyboardType.emailAddress
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 3 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "PhoneIcon")
                cell.informationTextField.placeholder = "phone"
                cell.informationTextField.keyboardType = UIKeyboardType.phonePad
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 4 {
                let cell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")!as! DetailCell
                cell.iconImageView.image = UIImage(named: "CalendarIcon")
                cell.informationTextField.placeholder = "Date of Birth"
                cell.informationTextField.text = user.dobString
                cell.informationTextField.tag = indexPath.row
                return cell
            }
            if indexPath.row == 5 {
                let cell:DatePickerCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell")!as! DatePickerCellTableViewCell
                cell.dobPicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: UIControlEvents.valueChanged)
                cell.dobPicker.setValue(UIColor.white, forKeyPath: "textColor")
                return cell
            }
            if indexPath.row == 6 {
                let cell:GenderSelectionCell = tableView.dequeueReusableCell(withIdentifier: "GenderSelectionCell")!as! GenderSelectionCell
                cell.genderMaleButton.tag = 101
                cell.genderFemaleButton.tag = 102
                if user.gender == "" {
                    cell.genderMaleButton.backgroundColor = UIColor.clear
                    cell.genderFemaleButton.backgroundColor = UIColor.clear
                } else {
                    if user.gender == "Male" {
                        cell.genderMaleButton.backgroundColor = UIColor.white
                        cell.genderFemaleButton.backgroundColor = UIColor.clear
                    } else {
                        cell.genderMaleButton.backgroundColor = UIColor.clear
                        cell.genderFemaleButton.backgroundColor = UIColor.white
                    }
                }
                
                return cell
            }
        }
        
        
        return nullCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 4 {
            if !isDatePickerRequire {
                insertRowAtIndexPath(indexPath: indexPath)
            } else {
                deleteRowAtIndexPath(indexPath: indexPath)
            }
        }
        
    }
    
    func insertRowAtIndexPath(indexPath: IndexPath) {
        
        isDatePickerRequire = true
        informationTableView.beginUpdates()
        let datePickerIndex: IndexPath = IndexPath(row: 5, section: 0)
        informationTableView.insertRows(at: [datePickerIndex], with: .fade)
        informationTableView.deselectRow(at: indexPath, animated: true)
        informationTableView.endUpdates()
    }
    func deleteRowAtIndexPath(indexPath: IndexPath) {
        
        isDatePickerRequire = false
        informationTableView.beginUpdates()
        let datePickerIndex: IndexPath = IndexPath(row: 5, section: 0)
        informationTableView.deleteRows(at: [datePickerIndex], with: .fade)
        informationTableView.deselectRow(at: indexPath, animated: true)
        informationTableView.endUpdates()
    }
    
    // MARK: Keyboard Apperance Selector Method
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            bottomSpacingContraint.constant = keyboardHeight
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            bottomSpacingContraint.constant = 0.0
        }
    }
    
    // MARK: TextField Delegate Methods
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        if textField.tag == 4 {
            if !isDatePickerRequire {
                insertRowAtIndexPath(indexPath: IndexPath(row: 5, section: 0))
            } else {
                deleteRowAtIndexPath(indexPath: IndexPath(row: 5, section: 0))
            }
            return false
        }
        
        self.view.addGestureRecognizer(tapGestureOnView)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField.tag < (informationTableView.numberOfRows(inSection: 0) - 1) {
            if(textField.returnKeyType == UIReturnKeyType.next) {
                let next: UIView = self.view.viewWithTag(textField.tag+1)!
                next.becomeFirstResponder()
            }
        }
        else{
            textField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: Choose Image Action
    
    @IBAction func chooseImageButtonClickAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose image from:", message: nil, preferredStyle: .actionSheet)
        
        let chooseCamera = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.getPicturefromCamera()
        }
        let choosePhotoLibrary = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.getPicturefromLibrary()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            
            
        }
        alertController.addAction(chooseCamera)
        alertController.addAction(choosePhotoLibrary)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    func getPicturefromCamera()  {
        picker.allowsEditing = true
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        self.present(picker, animated: true, completion: nil)
    }
    
    func getPicturefromLibrary()  {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        user.image.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: DatePicker Handler
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dobField : UITextField = (self.view.viewWithTag(4))! as! UITextField
        user.dobString = dateFormatter.string(from: sender.date)
        dobField.text = dateFormatter.string(from: sender.date)
    }
    
    // MARK: Gesture Recognizer Handler
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UITapGestureRecognizer {
            for tag in 1...3 {
                let view : UIView = (self.view.viewWithTag(tag))!
                view.resignFirstResponder()
            }
        }
        self.view.removeGestureRecognizer(tapGestureOnView)
        return true
    }
    
    // MARK: Gender Select Action
    @IBAction func genderButtonClicked(_ sender: UIButton) {
        
        if sender.tag == 101 {
            user.gender = "Male"

            sender.backgroundColor = UIColor.white
            let femaleButton : UIButton = (self.view.viewWithTag(102))! as! UIButton
            femaleButton.backgroundColor = UIColor.clear
        } else {
            user.gender = "Female"
            sender.backgroundColor = UIColor.white
            let maleButton : UIButton = (self.view.viewWithTag(101))! as! UIButton
            maleButton.backgroundColor = UIColor.clear
        }
        
    }
    
    // MARK: Save Details Button
    
    @IBAction func saveDetailsClickAction(_ sender: Any) {
        
        if validateFields() {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let showDetailViewController: ShowDetailViewController = storyBoard.instantiateViewController(withIdentifier: "ShowDetailViewController") as! ShowDetailViewController
            showDetailViewController.user = user
            self.navigationController?.pushViewController(showDetailViewController, animated: true)
        }
    }
    
    
    func validateFields() -> Bool {
        
        let nameField : UITextField = (self.view.viewWithTag(1))! as! UITextField
        let emailField : UITextField = (self.view.viewWithTag(2))! as! UITextField
        let phoneField : UITextField = (self.view.viewWithTag(3))! as! UITextField
        let dobField : UITextField = (self.view.viewWithTag(4))! as! UITextField
        if nameField.text == "" {
            showAlertWithTitle(title: "Warning", andMessage: "Please enter name.")
            return false
        }
        if !emailValidation(email: emailField.text!) {
            showAlertWithTitle(title: "Warning", andMessage: "Please enter correct email.")
            return false
        }
        if NumberFormatter().number(from: phoneField.text!) == nil || ((phoneField.text?.characters.count)! as Int != 10) {
            showAlertWithTitle(title: "Warning", andMessage: "Please enter correct 10 digit phone number.")
            return false
        }
        if dobField.text == "" {
            showAlertWithTitle(title: "Warning", andMessage: "Please enter your birth date.")
            return false
        }
        if user.gender == "" {
            showAlertWithTitle(title: "Warning", andMessage: "Please select gender.")
            return false
        }
        user.name = nameField.text!
        user.email = emailField.text!
        user.phoneNumber = phoneField.text!
        user.dobString = dobField.text!
        return true
    }
    
    func emailValidation(email: String) -> Bool {
        let emailRegEx: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func showAlertWithTitle(title: String, andMessage message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
}

