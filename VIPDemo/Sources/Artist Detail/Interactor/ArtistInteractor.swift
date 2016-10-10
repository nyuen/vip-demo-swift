//
//  ArtistInteractor.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit


// MARK: - ArtistInteractorInput

protocol ArtistInteractorInput: ArtistViewControllerOutput {

}


// MARK: - ArtistInteractorOutput

protocol ArtistInteractorOutput {

    func presentAlbums(albums: [Album])
}


// MARK: - ArtistInteractor

class ArtistInteractor: ArtistInteractorInput {

    var output: ArtistInteractorOutput!
    var worker: AlbumWorker!

    var albums: [Album]?


    // MARK: - Business logic

    func fetchAlbums(artistId: String) {

        worker = AlbumWorker()
        worker.fetchAlbums(artistId: artistId) { [weak self] albums, error in

            if let strongSelf = self {

                strongSelf.albums = albums

                if let albumsError = error {

                    // TODO: (SM) error handling

                    print("ERROR: \(albumsError)")

                } else {

                    strongSelf.output.presentAlbums(albums: albums)
                }
            }
        }
    }


}
