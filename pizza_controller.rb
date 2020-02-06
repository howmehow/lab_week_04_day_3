require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/pizza_order")
also_reload("./models/*")

#read all index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end
#create
get '/pizza-orders/new' do #it does have to be above :id because otherwise it's never gonna actually hit this path
  erb(:new)
end
#create post method
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end



get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id'do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect "/pizza-orders"
end

#delete
post '/pizza-orders/:id/delete' do
  id = params[:id]
  order = PizzaOrder.find(id)

  order.delete()
  redirect '/pizza-orders'
end
#read one - show
get '/pizza-orders/:id'do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end




#update
