module ApplicationHelper
  # http://railscasts.com/episodes/228-sortable-table-columns?view=asciicast
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
  #def url_for(options = {})
  #  if !session[:is_internal].nil?
  #    if session[:is_internal].to_s.downcase == 'false'
  #      options.reverse_merge!(session[:external_token])
  #    end
  #  end
  #  super
  #end
end
