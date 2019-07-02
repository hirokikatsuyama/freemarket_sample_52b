class TransactionsController < ApplicationController

  def listing
    @listing = Transaction.where(status: 1)
  end

  def in_progress
    @in_progress = Transaction.where(status: 2)
  end

  def completed
    @completed = Transaction.where(status: 3)
  end

end
