//
//  ServicesContainer.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/18/22.
//

extension DIContainer {
    struct Services {
        let countriesService: CountriesService
        let imagesService: ImagesService
        let userPermissionsService: UserPermissionsService

        init(countriesService: CountriesService,
             imagesService: ImagesService,
             userPermissionsService: UserPermissionsService)
        {
            self.countriesService = countriesService
            self.imagesService = imagesService
            self.userPermissionsService = userPermissionsService
        }

        static var stub: Self {
            .init(countriesService: StubCountriesService(),
                  imagesService: StubImagesService(),
                  userPermissionsService: StubUserPermissionsService())
        }
    }
}
