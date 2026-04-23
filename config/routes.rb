Rails.application.routes.draw do
  # アプリを開いたら、いきなりボタン画面（index）が出るようにする
  root "sales#index"
  
  # 売上記録用のルート
  resources :sales, only: [:index, :create, :destroy] do
    collection do
      get :manage # 管理画面用
    end
  end
end