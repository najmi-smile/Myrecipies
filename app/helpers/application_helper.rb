module ApplicationHelper
  def gravatar_for(cheff, options = {size:80})
    gravatar_id = Digest::MD5::hexdigest(cheff.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: cheff.name, class: 'gravatar')
    
  end
end
