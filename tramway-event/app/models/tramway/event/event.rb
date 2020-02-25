# frozen_string_literal: true

class Tramway::Event::Event < ::Tramway::Event::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validate :check_dimensions

  def check_dimensions
    if photo.width < 1920 || photo.height < 1080
      errors.add :photo, 'слишком маленькое. Размер изображение должен быть не меньше 1920*1080.'
    end
  end

  has_many :participants, class_name: 'Tramway::Event::Participant'
  has_many :participant_form_fields, class_name: 'Tramway::Event::ParticipantFormField'
  has_many :sections, class_name: 'Tramway::Event::Section'
  has_many :partakings, as: :part, class_name: 'Tramway::Event::Partaking'
  has_many :partnerships, class_name: 'Tramway::Partner::Partnership', as: :partner
  has_many :organizations, as: :partners, through: :partnerships, class_name: 'Tramway::Partner::Organization'
  has_and_belongs_to_many :places

  enumerize :status, default: :common, in: %i[common main]

  scope :main_event, -> { active.where(status: :main) }
  scope :actual, -> { order(:begin_date).where('end_date > ?', DateTime.now) }
  scope :past, -> { where 'end_date < ?', DateTime.now }

  def request_collecting_state
    return :not_initialized unless request_collecting_begin_date.present? || request_collecting_end_date.present?
    return :will_begin_soon if request_collecting_begin_date > DateTime.now
    return :is_over if request_collecting_end_date.present? && request_collecting_end_date < DateTime.now
    return :are_being_right_now if request_collecting_begin_date&.past? && request_collecting_end_date&.future?
    return :are_being_right_now if request_collecting_begin_date < DateTime.now && !request_collecting_end_date.present?
  end

  include ::Tramway::Partner::Scopes if defined? ::Tramway::Partner
end
