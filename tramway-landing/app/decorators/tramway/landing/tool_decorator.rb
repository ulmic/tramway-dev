class Tramway::Landing::ToolDecorator < Tramway::Core::ApplicationDecorator
  delegate_attributes :title, :account_id
end
