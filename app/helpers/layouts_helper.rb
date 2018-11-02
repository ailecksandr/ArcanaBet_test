# frozen_string_literal: true

module LayoutsHelper
  BACK_LINK = 'javascript:history.back()'

  def controller_stylesheet_link_tag
    stylesheet_link_tag ::Assets::General.call(css_params)
  end

  def controller_script_include_tag(**options)
    javascript_include_tag ::Assets::General.call(js_params), options
  end

  def action_stylesheet_link_tag
    stylesheet_link_tag ::Assets::Action.call(css_params)
  end

  def action_script_include_tag(**options)
    javascript_include_tag ::Assets::Action.call(js_params), options
  end

  def page_title
    return controller_title unless I18n.exists?(action_page_title_key)

    t('page_title', title: t(action_page_title_key))
  end

  private

  def css_params
    {
      type:       :css,
      controller: current_controller,
      action:     current_action
    }
  end

  def js_params
    {
      type:       :js,
      controller: current_controller,
      action:     current_action
    }
  end

  def current_controller
    exception? ? controller_name : params[:controller]
  end

  def current_action
    return action_name if exception?
    return :new        if action_name.inquiry.create?
    return :edit       if action_name.inquiry.update?

    params[:action]
  end

  def exception?
    controller_name.inquiry.exceptions?
  end

  def action_page_title_key
    "#{controller_path}.#{current_action}.title"
  end

  def controller_page_title_key
    "#{controller_path}.title"
  end

  def controller_title
    t(
      'page_title',
      title:  t(controller_page_title_key, default: t('default_page_title'))
    )
  end

  def controller_path
    current_controller.tr('/', '.')
  end
end
