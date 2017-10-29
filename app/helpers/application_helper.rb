module ApplicationHelper
    def profile_img(user)
      return image_tag(user.avatar, alt: user.name) if user.avatar?

      unless user.provider.blank?
        img_url = user.image_url
      else
        img_url = 'no_image.png'
      end
      image_tag(img_url, alt: user.name)
    end
    
    def new_profile_img(user,imgsize)
        return image_tag(user.avatar, alt: user.name, size: imgsize) if user.avatar?

        unless user.provider.blank?
            img_url = user.image_url
        else
            img_url = 'no_image.png'
        end
        image_tag(img_url, alt: user.name, size: imgsize)
    end
end
