class InformationSourcesController < ApplicationController
  before_action :set_information_source, only: [:destroy]

  def destroy
    @information_source.destroy
    redirect_to edit_user_path(current_user), notice: 'Information source was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information_source
      @information_source = InformationSource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def information_source_params
      params.require(:information_source).permit(:rss, :logo, :name)
    end
end
