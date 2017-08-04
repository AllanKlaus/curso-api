module V2
  class AddressSerializer < ActiveModel::Serializer
    attributes :id, :street, :city

    has_one :contact do
      link(:related) { v2_contact_url(object.contact) }
    end
  end
end
