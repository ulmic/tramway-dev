module Tramway::Admin::Navbar
  def navbar_structure(*links)
    @navbar_structure ||= links
  end

  def navbar_items_for(project, role:)
    @singleton_models_for ||= singleton_models_for(project, role: role)
    @available_models_for ||= available_models_for(project, role: role)
    @navbar_structure ||= {}
    @navbar_structure.map do |item|
      if item.is_a? Class
        should_be_in_navbar_as item
      elsif item.is_a? Hash
        sub_items = item.values.first.map do |sub_item|
          should_be_in_navbar_as sub_item
        end.compact
        { item.keys.first => sub_items } if sub_items.any?
      end
    end.compact
  end

  private

  def should_be_in_navbar_as(item)
    if @singleton_models_for.include?(item)
      { item => :singleton }
    elsif @available_models_for.include?(item)
      { item => :record }
    end
  end
end
