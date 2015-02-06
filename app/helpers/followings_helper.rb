module FollowingsHelper
  def toggle_follow_button follower, followed
    if follower.followed_ids.include? followed.id
      link_to following_path(id: follower.followings.select {|f| f.followed_id == followed.id}.first.id), method: :delete, remote: true do
        content_tag(:div, 'e', class: "btn icon")
      end
    else
      link_to followings_path(followed_id: followed.id), method: :post, remote: true do
        content_tag(:div, 'g', class: "btn icon")
      end
    end
  end
end
