class FiguresController < ApplicationController
  set :views, proc { File.join(root, '../views/') }
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/application/new_figure"
  end
  
  post '/figures' do
    #binding.pry
    @figure = Figure.new(params['figure'])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
