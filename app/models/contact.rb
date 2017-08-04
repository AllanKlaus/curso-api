class Contact < ApplicationRecord
  validates_presence_of :kind
  validates_presence_of :address
  belongs_to :kind
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def author
  #   "Klaus"
  # end
  #
  # def kind_description
  #   self.kind.description
  # end
  #
  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description],
  #     include: { kind: { only: :description } }
  #   )
  # end

  def as_json(options = {})
    h = super(options.merge(include: [:kind, :address, :phones]))
    h[:birthdate] = (I18n.l(self.birthdate) if self.birthdate)
    h
  end
end
