class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
      // "/" (action: 'list',controller: 'user')
        "/"(action:'productDetails',controller: 'product')


		//"/"(view:"/index")
		"500"(view:'/error')

	}
}
