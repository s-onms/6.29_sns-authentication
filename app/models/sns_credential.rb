class SnsCredential < ApplicationRecord

  # モデルにomniauthを使うためにオプションを追記
  # アソシエーションの設定
  belongs_to :user, optional: true
end
