class TransactionsController < ApplicationController

  def listing
    @listing = Transaction.where(status: 1, seller_id: current_user.id)
  end

  def in_progress
  end

  def completed
    @completed = Transaction.where(status: 3, seller_id: current_user.id)
  end

end
