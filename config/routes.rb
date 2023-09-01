Rails.application.routes.draw do
 
# namespaceを使いURL指定のパスにしたいファイル構成指定のパスにしたいを実装
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

