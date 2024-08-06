class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  STATUS_PENDING = 'pending'
  STATUS_APPROVED = 'approved'

  has_and_belongs_to_many :stocks

  # Callbacks
  after_initialize :set_default_status, if: :new_record?
  after_create :send_pending_email
  after_update :send_approved_email, if: :saved_change_to_status?

  def approve!
    update!(status: STATUS_APPROVED)
  end

  private

  def set_default_status
    self.status ||= STATUS_PENDING
  end

  def send_pending_email
    UserMailer.with(user: self).account_pending.deliver_later if status == STATUS_PENDING
  end

  def send_approved_email
    UserMailer.with(user: self).account_approved.deliver_later if status == STATUS_APPROVED
  end
end
