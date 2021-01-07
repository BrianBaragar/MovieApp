//
//  HomeView.swift
//  Movie App
//
//  Created by Brian Baragar on 21/12/20.
// Video 10

import UIKit
import RxSwift

class HomeView: UIViewController {
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.bind(view: self, router: router)
        getData()
        configureTableView()
    }

    private func getData(){
        return viewModel.getListMoviesData()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { movies in
                self.movies = movies
                self.reloadTableView()
            }, onError: { error in
                print(error)
            }, onCompleted: {
            }).disposed(by: disposeBag)
    }
    
    private func configureTableView(){
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }
    /*
    // MARK: - Navigation
     //Manejar la concurrencia o hilos en RxSwift
     .suscribeOn(MainScheduler.instance)
     //Suscribirme a el observable
     .observeOn(MainScheduler.instance)
     ///Suscribirme a el observable
     .suscribe(OnNext)
    */
}

//MARK: - Table View
extension HomeView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.tittleMovie.text = self.movies[indexPath.row].title
        cell.descriptionMovie.text = self.movies[indexPath.row].sinopsis
        cell.imageMovie.imageFromServerURL(urlString: "\(Constants.URL.hostImages+self.movies[indexPath.row].image)", placeHolderImage: UIImage(named: "defaultmovie")!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
