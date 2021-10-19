class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  
  def back
    @contact = Contact.new(contact_params)
    render :new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      flash[:notice] = "お問い合わせを受け付けました"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def done
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
  end
end
