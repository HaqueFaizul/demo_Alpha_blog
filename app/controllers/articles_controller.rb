class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	def index
		@article=Article.all
	end

	def about

	end
	def show
		
	end

	def new
		@article=Article.new
	end

	def edit
		
	end
 
	def create
		#render plain: params[:article]

		#@article=Article.new(params[:artile])
		#render plain: @article

		#@article=Article.new(params.require(:article).permit(:title,:description))
		#render plain: @article.inspect

		@article=Article.new(params.require(:article).permit(:title,:description))
		#render plain: @article.inspect
		@article.save
		if @article.save
			flash[:notice]="Article created successfully!"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def update
		
		if @article.update(params.require(:article).permit(:title,:description))
			flash[:notice]="Updated successfully"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end
	def destroy
		
		@article.destroy
		redirect_to articles_path
	end

	private
		def set_article
			@article=Article.find(params[:id])
		end
end
