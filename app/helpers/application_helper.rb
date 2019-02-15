module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.chefname, class: "img-circle")
  end


    def current_chef
      @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
    end

    def logged_in?
      !!current_chef
    end

    def require_user
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action."
        redirect_to root_path
      end
    end

end
