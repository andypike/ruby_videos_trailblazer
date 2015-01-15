module AuthorizedOperation
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    attr_accessor :authorize_args

    def authorize(*args)
      self.authorize_args = args
    end
  end

  def process(params)
    authorize!(params[:current_user])

    authorised_process(params)
  end

  def present(params)
    authorize!(params[:current_user])
    super

    authorized_present(params)
  end

  private

  def authorised_process(_)
    self
  end

  def authorized_present(_)
    self
  end

  def authorize!(current_user)
    Ability.new(current_user).authorize!(*self.class.authorize_args)
  end
end
