class Tramway::Landing::ToolDecorator < Tramway::ApplicationDecorator
  delegate_attributes :title, :account_id
end
