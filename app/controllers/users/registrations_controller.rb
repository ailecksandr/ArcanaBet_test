# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :require_no_authentication, only: %i[new create cancel], if: :current_user

    protected

    def require_no_authentication
      redirect_to root_path, alert: t('devise.failure.already_authenticated')
    end
  end
end
