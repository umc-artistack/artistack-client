//
//  LikePopupViewController.swift
//  Practice_Artistack
//
//  Created by 임영준 on 2022/07/30.
//

import UIKit

class LikePopupViewController: UIViewController {

    @IBOutlet weak var likeTableView: UITableView!
    @IBOutlet weak var popupDismissButton: UIButton!
    @IBOutlet weak var emptyLikePeopleView: UIView!
    @IBOutlet weak var likePeopleCntDisplay: UILabel!
    
    static var likePeopleCnt: Int = Int()
    static var likePeopleList: [Person?] = []
    static var projectId: Int = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillLikePeopleTable()
        // 이전에 남은 것이 출력되는 List
        print("[LikePopupViewController] likePeopleList : ", LikePopupViewController.likePeopleList)
        // Count는 잘 출력됨
        print("[LikePopupViewController] likePeopleCnt : ", LikePopupViewController.likePeopleCnt)
        likePeopleCntDisplay.text = String(LikePopupViewController.likePeopleCnt)
        
        if LikePopupViewController.likePeopleCnt > 0 {
            emptyLikePeopleView.isHidden = true
            likeTableView.isHidden = false
            setupLikeTableView()
        } else {
            emptyLikePeopleView.isHidden = false
            likeTableView.isHidden = true }
        // Do any additional setup after loading the view.
    }
    
    
    func fillLikePeopleTable(){
        HomeRepository().likedPeopleListManager(projectId: LikePopupViewController.projectId, completion: {
            [weak self]res in
            LikePopupViewController.likePeopleList = res
            self?.likeTableView.reloadData()
            //print(res)
        })
    }
    
    
    func setupLikeTableView(){
        // 이전에 남아있던 것이 출력되는
        print("[setupLikeTableView] likePeopleList : ", LikePopupViewController.likePeopleList)
        likeTableView.layer.backgroundColor = UIColor.clear.cgColor
        likeTableView.backgroundColor = .clear
        likeTableView.translatesAutoresizingMaskIntoConstraints = false
        likeTableView.register(UINib(nibName: "LikeTableViewCell", bundle: nil), forCellReuseIdentifier: "likeCell")
        likeTableView.showsVerticalScrollIndicator = false
        likeTableView.delegate = self
        likeTableView.dataSource = self
    }
 
    @IBAction func popupDismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
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

extension LikePopupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LikePopupViewController.likePeopleList.count // 추후 변경
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "likeCell", for: indexPath) as! LikeTableViewCell
        cell.backgroundColor = .clear
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.contentView.backgroundColor = UIColor.clear
        
        cell.likerNicknameLbl.text = LikePopupViewController.likePeopleList[indexPath.row]?.nickname
        //cell.likerImageView.load(url: URL(string: LikePopupViewController.likePeopleList[indexPath.row]?.profileImgUrl ?? nil))
        cell.likerImageView.setImage(with: LikePopupViewController.likePeopleList[indexPath.row]?.profileImgUrl ?? nil)
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
}
