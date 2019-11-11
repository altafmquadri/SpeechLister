class Api::V1::ListsController < ApplicationController
    def index
        lists = List.all
        render json: Api::V1::ListSerializer.new(lists).to_serialize_json
    end

    def create
        list = List.new(list_params)
        list.save
        render json: Api::V1::ListSerializer.new(list).to_serialize_json
    end

    def destroy
        list = List.find(params[:id])
        render json: Api::V1::ListSerializer.new(list.destroy).to_serialize_json
    end

    private
    def list_params
        params.require(:list).permit(:category, :title)
    end
end
