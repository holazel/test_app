class StaticPagesController < ApplicationController
	def about
		redirect_to static_pages_landing_page_url
	end

	def contact
	end

	def index
	end

  	def landing_page    
    	@products = Product.limit(2)
  	end
end
