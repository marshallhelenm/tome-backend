class ImagesController < ApplicationController

    def create
        byebug
    end

    def destroy
        img = Image.find(img_params['img_id'])
        img.destroy
        render :json => {
            message: 'Image Deleted'
        } 
    end


    private

    def img_params
        params.require(:image).permit(:img_id, :url, :world_id)
    end

end
