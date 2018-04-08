class Tramway::Mailout::MailingJob < ActiveJob::Base
  queue_as :default

  def perform(contacts, template, mailer, sender_email, &block)
    contacts.each_slice(100) do |combination|
      combination.each do |contact|
        mailer.constantize.delay.just_message contact.email, sender_email, template.title, template.filled_body(contact)
        yield if block_given?
      end
    end
  end
end
