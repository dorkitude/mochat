module ApplicationHelper

  def nav_link(params, accesskey, text)
    url = url_for(params)

    text = text.to_s
    accesskey = accesskey.to_s

    link = "<a class='nav_link' accesskey='#{accesskey}' href='#{url}'><span class='accesskey'>#{accesskey}</span><span class='text'>#{text.capitalize}</span></a>"

  end
  
end
