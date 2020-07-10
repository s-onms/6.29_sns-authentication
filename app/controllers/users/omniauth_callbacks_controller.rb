class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # callback for facebook
  def facebook
    # callback_for(:facebook)
    # カリキュラムではピンポイントで関数を記載（どちらでもいいはず）
    authorization
  end

  # callback for google
  def google_oauth2
    # callback_for(:google)
    # カリキュラムではピンポイントで関数を記載（どちらでもいいはず）
    authorization
  end

  def authorization
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
  end

  def failure
    redirect_to root_path
  end

end