class Video < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD
    include AuthorizedOperation

    model Video, :create
    authorize :manage, Video

    def video
      model
    end

    contract do
      model Video

      property :title,        :validates => { :presence => true }
      property :presenter_id, :validates => { :presence => true }
      property :original_url, :validates => { :presence => true }
      property :host
      property :embed_url,    :validates => { :presence => true }
      property :status
      property :thumbnail
      property :originally_posted_on, :validates => { :presence => true }
    end

    def authorised_process(params)
      validate(params[:video]) do |f|
        f.save
      end
    end
  end
end


