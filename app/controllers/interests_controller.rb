class InterestsController < ApplicationController
  before_action :set_interest, only: [:destroy]

  def destroy
    @interest.destroy
    redirect_to edit_user_path(current_user), notice: 'Interest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interest_params
      params.require(:interest).permit(:word)
    end
end
