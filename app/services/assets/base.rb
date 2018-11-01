# frozen_string_literal: true

module Assets
  class Base < Callable
    ROOT = 'pages'

    mandatory_methods :path

    def initialize(type:, controller:, action:)
      @type       = type
      @controller = controller
      @action     = action
    end

    def call
      asset_available? ? path : ''
    end

    private

    attr_reader :type, :controller, :action

    def path
      raise NotImplementedError
    end

    def path_with_extension
      @path_with_extension ||= "#{path}.#{type}"
    end

    def asset_available?
      return ::Rails.application.precompiled_assets.include?(path_with_extension) if assets_compile?

      ::Rails.application.assets_manifest.assets[path_with_extension].present?
    end

    def assets_compile?
      ::Rails.configuration.assets.compile
    end
  end
end
