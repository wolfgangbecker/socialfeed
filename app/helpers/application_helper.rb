module ApplicationHelper
  def sidebar_link_to name, controller_name, &block
    if block_given?
      link_to send("#{name}_path"), class: "text-center sidebar-btn #{'selected' if controller_name == name}", &block
    else  
      link_to send("#{name}_path"), class: "text-center #{'selected' if controller_name == name}" do
        I18n.t("layouts.aside.#{name}")
      end
    end
  end
end
