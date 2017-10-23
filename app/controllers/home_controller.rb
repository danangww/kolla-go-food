class HomeController < ApplicationController
  def hello
    @time = Date.today
    @users = User.all
    @request = request
    @response = response
  end
  def goodbye
    @tomorrow = Date.today.next_day(1)
  end
end
