# frozen_string_literal: true

class Tramway::Event::Event < ::Tramway::Core::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validate :check_dimensions

  def check_dimensions
    if photo.present?
      errors.add :photo, :too_small_image if photo.width.present? && (photo.width < 1920 || photo.height < 1080)
    end
  end

  has_many :participants, class_name: 'Tramway::Event::Participant'
  has_many :participant_form_fields, -> { order(position: :asc) }, class_name: 'Tramway::Event::ParticipantFormField'
  has_many :sections, class_name: 'Tramway::Event::Section'
  has_many :partakings, as: :part, class_name: 'Tramway::Event::Partaking'
  has_many :partnerships, class_name: 'Tramway::Partner::Partnership', as: :partner
  has_many :organizations, as: :partners, through: :partnerships, class_name: 'Tramway::Partner::Organization'
  has_many :actions, -> { order(id: :asc) }, class_name: 'Tramway::Event::Action'
  has_and_belongs_to_many :places

  enumerize :reach, default: :open, in: %i[open closed]

  scope :actual, -> do
    where('begin_date > ?', DateTime.now).or(where('begin_date < ? AND end_date > ?', DateTime.now, DateTime.now)).order(begin_date: :asc)
  end
  scope :past, -> { where 'end_date < ?', DateTime.now }
  scope :open, -> { where reach: :open }
  scope :closed, -> { where reach: :closed }

  validates :begin_date, presence: true
  validates :end_date, presence: true

  def request_collecting_state
    return :not_initialized unless request_collecting_begin_date.present? || request_collecting_end_date.present?
    return :will_begin_soon if request_collecting_begin_date > DateTime.now
    return :is_over if request_collecting_end_date.present? && request_collecting_end_date.to_date < Date.today
    if request_collecting_begin_date&.past? && (request_collecting_end_date&.future? || request_collecting_end_date&.today?)
      return :are_being_right_now
    end
    return :are_being_right_now if request_collecting_begin_date < DateTime.now && !request_collecting_end_date.present?
  end

  include ::Tramway::Partner::Scopes if defined? ::Tramway::Partner
end
