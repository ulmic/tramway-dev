module Tramway
  module Collections
    module Helper
      def collection_list_by(name:)
        require name # needed to load class name with collection
        unless ::Tramway::Collection.descendants.map(&:to_s).include?(name.camelize)
          raise "There no such collection named #{name.camelize}. Please create class with self method `list` and extended of `Tramway::Collection`" 
        end

        name.camelize.constantize.list
      end
    end
  end
end
