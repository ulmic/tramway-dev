class CreateTramwayConferencePeopleEventSections < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_conference_people_event_sections do |t|
      t.integer :section_id
      t.integer :person_id

      t.timestamps
    end
  end
end
