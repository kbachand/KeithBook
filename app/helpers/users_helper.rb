module UsersHelper
  def friend_buttons(user)
    case current_user.friendship_status(user)
    when "not_friends"
      link_to "Add Friend", friendships_path(user_id: user.id), method: :post
    when "friends"
      link_to "Remove Friend", friendships_path(current_user.friendship_relation(user)), method: :delete
    when "pending"
       link_to "Cancel Request", friendships_path(current_user.friendship_relation(user)), method: :delete
    when "requested"
      accept
      deny =  link_to "Deny", friendships_path(current_user.friendship_relation(user)), method: :delete
    end
  end
end
