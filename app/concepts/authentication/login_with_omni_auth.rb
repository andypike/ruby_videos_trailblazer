module Authentication
  class LoginWithOmniAuth < Trailblazer::Operation
    def model
    end

    def process(params)
      # TODO: Create or load user from params info.
      #       Thinking that the validation should ensure that we are passed a
      #       provider, uid and other details within params.
      self
    end
  end
end
