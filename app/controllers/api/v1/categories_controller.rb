# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[destroy]

      # GET /categories
      def index
        @categories = Category.all
        render json: CategoriesRepresenter.new(@categories).as_json
      end

      # GET /categories/1
      def show
        render json: @category
      end

      # POST /categories
      def create
        @category = Category.create(category_params)

        if @category.save
          render json: CategoriesRepresenter.new(@category).as_json, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /categories/1
      def destroy
        @category.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.permit(:name)
      end
    end
  end
end
