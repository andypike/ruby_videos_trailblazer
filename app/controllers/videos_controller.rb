class VideosController < ApplicationController
  def new
    form Video::Create
  end

  def create
    run Video::Create do
      return redirect_to root_path, :notice => "Successfully added video!"
    end

    render :new
  end

  def process_params!(params)
    params.merge!(
      :current_user => current_user
    )
  end
end
