module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate

    belongs_to :kind, optional: true do
      link(:related) { v1_contact_kinds_url(object) }
    end
    has_many :phones do
      link(:related) { v1_contact_phones_url(object) }
    end
    has_one :address do
      link(:related) { v1_contact_address_url(object) }
    end

    # link(:self) { contact_url(object) }

    meta do
      { author: 'Klaus' }
    end

    def attributes(*args)
      h = super(*args)
      # h[:birthdate] = (I18n.l(object.birthdate) if object.birthdate)
      h[:birthdate] = birthdate
      h
    end

    private

    def birthdate
      object.birthdate.to_time.iso8601 if object.birthdate
    end
  end
end
