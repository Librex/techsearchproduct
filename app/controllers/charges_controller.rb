class ChargesController < ApplicationController
  before_action :authenticate_user!

  def free
    project = Project.find(params[:project_id])
    current_user.subscriptions.create(project: project)

    redirect_to project
  end

  def create
    project = Project.find(params[:project_id])

    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: project.price,
      description: project.name,
      currency: 'jpy'
    )

    if charge
      current_user.subscriptions.create(project: project)
      redirect_to project
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to project
  end
end
