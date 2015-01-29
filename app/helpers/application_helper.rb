module ApplicationHelper
  def sidebar_link_to name, controller_name
    link_to send("#{name}_path"), class: "text-center #{'selected' if controller_name == name}" do
      I18n.t("layouts.aside.#{name}")
    end
  end
end
