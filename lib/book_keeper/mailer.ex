defmodule BookKeeper.Mailer do
  @moduledoc """
  This module defines the main interface to deliver e-mails.
  """
  use Swoosh.Mailer, otp_app: :book_keeper
end
