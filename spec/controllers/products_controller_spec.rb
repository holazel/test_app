require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    @product1 = FactoryGirl.create(:product, name: "stella style", description: "awesome bike", color: "custom", price: "300")
    @product2 = FactoryGirl.create(:product, name: "lalastyle", description: "one of a kind", color: "black", price: "200")
    @product3 = FactoryGirl.create(:product, name: "sophia style", description: "awesome", color: "yellow", price: "100")
    @product4 = FactoryGirl.create(:product, name: "honey style", description: "great bike", color: "white", price: "150")


  #GET index action
  describe 'GET #index' do

    context 'when a GET request matches a search_term' do
      it 'displays the search request for a product' do
        get :index, params: {q: 'Custom style'}
        expect(assigns(:products)).to match_array([@product1])
        expect(response).to render_template('index')
      end
    end

    context 'when a GET request matches no search_term' do
      it 'displays all the products' do
        get :index
        expect(assigns(:products)).to.match_array([@product.all])
      end
    end
  end

  #GET show
  describe 'GET #show' do
    context 'when the GET show action is requested' do
      it 'renders the show template' do
        get :show, params: { id: @product1 }
        expect(response.status).to eq 200
        expect(response).to render_template('show')
      end
    end
  end

  #GET new
  describe 'GET #new' do
    context 'when the GET new is requested ' do
      it 'renders the new product template' do
        get :new
        expect(response).to redirect_to('new')
      end
    end
  end

  #POST create
  describe 'POST #create' do
    context 'when a new product is created successfully' do
      it 'save the product in the database' do
        before = Product.all.length
        post :create, params: { product: {name: "hola Bike", description: "testing testing", color: "blue", price: "250"}}
        after = Product.all.length
        expect(response.status).to eq 302
        expect(response).to redirect_to('@product')
        expect(after).to eq (before + 1)
      end
    end
  
    context 'when a new product is not created successfully' do
      it 'the product is not saved in the database' do
        before = Product.all.length
        post :create, params: { product: {name: "hola Bike"}}
        after = Product.all.length
        expect(response.status).to eq 200
        expect(response).to redirect_to('@product.errors')
        expect(after).to eq before
      end
    end
  end

  #PATCH update
  describe 'PATCH #update' do
    context 'when a product is updated' do
      it 'saves the product to the database' do
        before = Product.all.length
        patch :update, params: { id: @product1.id, product: {name: "lola style"} }
        after = Product.all.length
        expect(response.status).to eq 302
        expect(response).to redirect_to('@product')
        expect(after).to eq before
      end
    end
  end

  #DELETE destroy
  describe 'DELETE #destroy' do
    context 'when a product is deleted' do
      it 'destroy the product' do
        delete :destroy, params: {id: @product.id }
        expect(response.status).to eq 302
      end
    end
  end
  end
end