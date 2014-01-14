module ScreenshotsHelper
  def can_delete_screenshot?(screenshot)
    return user_signed_in? && (screenshot.user == current_user || !screenshot.user)
  end
end