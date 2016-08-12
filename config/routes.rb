Rails.application.routes.draw do

  get 'messages/new'

  get 'messages/create'

  	root 'static_pages#home'
  
	get 	'home',       	to: 'static_pages#home',        	as: 'home'
	get		'gallery',		to: 'photos#index',					as: 'gallery'
	get     'about',      	to: 'static_pages#about',       	as: 'about'
	get     'investment',	to: 'static_pages#investment',		as: 'investment'
	get     'studio', 	  	to: 'static_pages#studio',  		as: 'studio'
	get		'contact',		to: 'messages#new', 				as: 'contact'
	post	'contact',		to: 'messages#create'
	get     'clients',      to: 'static_pages#clients',			as: 'clients'
	

end
