require 'open-uri'
require 'net/http'
require 'rexml/document'
require 'rss'

class InformationSourcesController < ApplicationController
  before_action :set_information_source, only: [:destroy]
  before_action :check_link, only: [:create]

  def destroy
    @information_source.users.destroy(current_user)
    redirect_to edit_user_path(current_user), notice: 'Information source was successfully destroyed.'
  end

  def create
    link = information_source_params[:rss]

    source_hash = get_source_as_hash(link)

    @new_source = InformationSource.create_with(
                                    logo: source_hash[:logo],
                                    name: source_hash[:name]).find_or_initialize_by(rss: source_hash[:rss])

    if @new_source.save
      current_user.information_sources << @new_source unless current_user.information_sources.include?(@new_source)

      redirect_to edit_user_path(current_user), notice: 'Новый источник добавлен'
    else
      render edit_user_path(current_user), alert: 'Не могу сохранить'
    end
  end

  private

  def set_information_source
    @information_source = InformationSource.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def information_source_params
    params.require(:information_source).permit(:rss)
  end

  def check_link
    redirect_to edit_user_path(current_user), alert: 'Какая-то неправильная ссылка' unless correct_link?
  end

  # TODO подумать куда переместить и протестировать
  def correct_link?
    link = information_source_params[:rss]

    begin
      RSS::Parser.parse(open(link).read, false)
      response = Net::HTTP.get_response(URI.parse(link))
      REXML::Document.new(response.body)

      return true
    rescue
      return false
    end
  end

  def get_source_as_hash(link)
    response = Net::HTTP.get_response(URI.parse(link))
    doc      = REXML::Document.new(response.body)

    title_tag     = doc.root.elements['channel/title']
    image_url_tag = doc.root.elements['channel/image/url']

    # Картинки часто не бывает
    image_url = image_url_tag ? image_url_tag.text : nil

    return nil unless title_tag
    title = title_tag.text

    {name: title, logo: image_url, rss: link}
  end
end
