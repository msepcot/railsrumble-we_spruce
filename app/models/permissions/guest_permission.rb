module Permissions
  class GuestPermission < BasePermission
    def initialize
      allow 'users/registrations',  [:cancel, :create, :new, :edit, :update, :destroy]
      allow 'users/passwords',      [:create, :new, :edit, :update]
      allow 'devise/sessions',      [:new, :create, :destroy]
      allow :omniauth_callbacks,    [:passthru, :twitter]

      allow :pages,     [:root]
      allow :projects,  [:index, :show]
    end
  end
end