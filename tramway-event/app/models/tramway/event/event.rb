class Tramway::Event::Event < ::Tramway::Event::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :participants, class_name: 'Tramway::Event::Participant'
  has_many :participant_form_fields, class_name: 'Tramway::Event::ParticipantFormField'
  has_many :sections, class_name: 'Tramway::Event::Section'
  has_many :partakings, as: :part, class_name: 'Tramway::Event::Partaking'
  has_many :partnerships, class_name: 'Tramway::Partner::Partnership', as: :partner
  has_many :organizations, as: :partners, through: :partnerships, class_name: 'Tramway::Partner::Organization'


  enumerize :status, default: :common, in: [ :common, :main ]

  scope :main_event, -> { where(status: :main) }
  scope :actual, -> { where 'end_date > ?', DateTime.now }
  scope :past, -> { where 'end_date < ?', DateTime.now }
  
  def request_collecting_state
    return :not_initialized unless request_collecting_begin_date.present? || request_collecting_end_date.present?
    return :will_begin_soon if request_collecting_begin_date > DateTime.now
    return :is_over if request_collecting_end_date < DateTime.now
    return :are_being_right_now if request_collecting_begin_date&.past? && request_collecting_end_date&.future?
  end

  include ::Tramway::Partner::Scopes
end
