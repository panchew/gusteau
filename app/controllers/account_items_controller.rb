class AccountItemsController < ApplicationController

  def create
    product = Product.find params[:account_item][:product_id]

    account_item = AccountItem.find_or_create_by_account_id_and_product_id(params[:account_id], product.id)
    quantity = params[:account_item][:quantity].to_i + (account_item.quantity || 0)
    account_item.quantity = quantity
    account_item.price = product.price

    if account_item.save
      notice = 'Cuenta actualizada'
    else
      notice = 'No se pudo agregar'
    end

    redirect_to account_path(params[:account_id]), :notice => notice

  end

  def search_products
    if params[:term]
      product_list = Product.where("name like '#{params[:term]}%'")
    else
      product_list = Product.all
    end
    list = product_list.map { |p| Hash[ :value => p.name, :label => p.name, :price => p.price, :id => p.id ] }
    render :json => list
  end

end
