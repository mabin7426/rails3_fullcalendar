class SessionsController < ApplicationController

  def create

    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id

    # #What data comes back from OmniAuth?
    # @auth = request.env["omniauth.auth"]
    # #Use the token from the data to request a list of calendars
    # @token = @auth["credentials"]["token"]
    # client = Google::APIClient.new
    # client.authorization.access_token = @token
    # service = client.discovered_api('calendar')
    # @result = client.execute(
    #   :api_method => service.calendar_list.list,
    #   :parameters => {},
    #   :headers => {'Content-Type' => 'application/json'})

    redirect_to root_url, notice: "Signed in!"

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end
