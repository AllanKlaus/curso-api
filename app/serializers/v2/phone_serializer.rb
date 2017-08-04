module V2
  class PhoneSerializer < ActiveModel::Serializer
    attributes :id, :number

    belongs_to :contact do
      link(:related) { v2_contact_url(object.contact) }
    end
  end
end
