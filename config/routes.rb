Rails.application.routes.draw do
  #ルートパスとして'public/homes#top'を指定
  root to: 'public/homes#top'
#   moduleを使いU変えずにファイル構成指定のパスにしたいを実装
  scope module: :public do
    get 'about' => 'homes#about'
  end
# namespaceを使いURL指定のパスにファイル構成指定のパスにしたいを実装
namespace :admin do
  get '/' => 'homes#top'
end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
registrations: "public/registrations",
sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
sessions: "admin/sessions"
}
end

