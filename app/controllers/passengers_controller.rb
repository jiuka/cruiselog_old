class PassengersController < Clearance::UsersController
 
  def user_params
    params[:passenger] || Hash.new
  end

end
