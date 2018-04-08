module Tramway::Mailout::JobProxy
  class << self
    def perform_job(job_class, mode, *args)
      job_class.send "perform_#{mode}", *args.map { |a| convert a }
    end

    private

    def convert(object)
      if object.class.to_s.include? 'ActiveRecord_Associations_CollectionProxy'
        object.to_a
      elsif object.class == Class
        object.to_s
      else
        object
      end
    end
  end
end
