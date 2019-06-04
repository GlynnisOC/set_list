class Admin::AwardsController < ApplicationController

  def index
    @awards = Award.all
    @award = Award.new
  end

  def new
    @award = Award.new(award_params)
  end

  def create
    award = Award.create!(award_params)
    redirect_to awards_path
  end

  def show
    @award = Award.find_by(params[:award_id])
  end

  private
  def award_params
    params.require(:award).permit(:name)
  end
end
