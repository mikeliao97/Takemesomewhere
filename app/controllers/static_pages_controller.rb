class StaticPagesController < ApplicationController
  def index #this is the list of saved places
    @places = Place.all
    session[:global_variable] = 0
  end

  def saved #this is the list of saved preferences
  end

  def take_me #take me somewhere, posts this as well 
    if session[:global_variable] >= Place.all.length  #reset the counter
        session[:global_variable] = 1
    else
        session[:global_variable] += 1
    end

    @place = Place.find_by(:id => session[:global_variable])
  end


  def update_response #take_me posts form responses to this path
    #once you get the response store it.
    #and update index with the responses
    go = white_listed_params[:go]
    place = white_listed_params[:place]
      

    if go
      real_place = Place.find_by(id: place)
      real_place.user_id = User.first.id
      real_place.save
      redirect_to action: "more_info", place: real_place
    else
      redirect_to action: "take_me" 
    end
  end

  #more info includes youtube videos
  def more_info
    temp_place = white_listed_params[:place]
    @place = Place.find_by(id: temp_place)

  end

  def white_listed_params
    params.permit!
  end
  
end
