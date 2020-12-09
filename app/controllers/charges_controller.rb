class ChargesController < ApplicationController
  def new
    
  end
  
  def create
    # Amount in cents
    @amount = params[:price].to_i
    @price_converted = @amount * 100
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @price_converted,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    if charge
      @appointment = Appointment.find(params[:appointment_id])
      @appointment.is_paid = true
      @appointment.save
      flash[:success] = "Bravo, tu as réservé ta scéance et payé #{@amount} €!"
      redirect_to apprentice_show_user_path(current_user.id)
      payment_apprentice_send(appointment)
      payment_mentor_send(appointment)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path()
  end

  def payment_apprentice_send(appointment)
    UserMailer.payment_apprentice_confirmation(appointment).deliver_now
  end

  def payment_mentor_send(appointment)
    UserMailer.payment_mentor_confirmation(appointment).deliver_now
  end

end
