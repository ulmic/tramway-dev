# frozen_string_literal: true

every 1.minute do
  runner '::Tramway::Notify::Sender.send_now'
end
