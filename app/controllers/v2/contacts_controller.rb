module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]
    # before_action :authenticate_user!

    # GET /contacts
    def index
      page_number = params[:page].try(:[], :number)
      page_number = params[:page] ? params[:page][:size] : 1
      @contacts = Contact.all.page(page_number).per(params[:page][:size])

      # Paginação via Headers
      # paginate json: @contacts

      render json: @contacts
    end

    # GET /contacts/1
    def show
      render json: @contact, include: [:kind, :address, :phones]
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, status: :created
      else
        render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        # params.require(:contact).permit(
        # :name, :email, :birthdate, :kind_id,
        # phones_attributes: [:id, :number, :_destroy],
        # address_attributes: [:id, :street, :city]
        # )
      end
  end
end
