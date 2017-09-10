class StaticPagesController < ApplicationController
	def about
	end

	def contact
	end

	def index
	end

  	def landing_page    
    	@products = Product.limit(2)
  	end
end
