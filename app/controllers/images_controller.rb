class ImagesController < ApplicationController

    def destroy
        img = Image.find(img_params['img_id'])
        img.destroy
        render :json => {
            message: 'Image Deleted'
        } 
    end

    private

    def img_params
        params.require(:image).permit(:img_id)
    end

end
