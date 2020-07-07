class SnsCredential < ApplicationRecord

  # モデルにomniauthを使うためにオプションを追記
  belongs_to :user, optional: true
end
