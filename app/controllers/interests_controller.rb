class InterestsController < ApplicationController
  before_action :set_interest, only: [:destroy]

  def destroy
    @interest.destroy
    redirect_to edit_user_path(current_user), notice: 'Interest was successfully destroyed.'
  end

  def create
    @new_interest = Interest.find_or_initialize_by(word: interest_params[:word].downcase)

    if @new_interest.save
      current_user.interests << @new_interest unless current_user.interests.include?(@new_interest)

      redirect_to edit_user_path(current_user), notice: 'Новый тег добавлен'
    else
      render edit_user_path(current_user), alert: 'Возникла ошибка при сохранении'
    end
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
