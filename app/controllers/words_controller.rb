class WordsController < ApplicationController
  # 初期表示(TBD:タグとの連携、検索ロジックとの連携)
   def index
       @q = Word.ransack(params[:q])
       @words = @q.result.page(params[:page]).per(10)
   end
   # データを閲覧する画面を表示する (TBD:必要か？)
   def show
   end
   
   # データを作成する画面を表示する
   def new
       @word= Word.new
   end
   
   # データを更新する画面を表示する　(TBD:必要か？)
   def edit
       @word = Word.find(params[:id])
   end
   
   # データを作成する　(TBD:遷移先、エラー時)
   def create
       @word = Word.new(word_params)
       @word.save
       redirect_to words_path
   end
   
   # データを更新する　(TBD:遷移先、エラー時、必要か？)
   def update
       @word = Word.find(params[:id])
       @word.update_attributes(word_params)
       redirect_to words_path
   end
   
   # データを削除する　(TBD:遷移先、エラー時、不要か？)
   def destroy
       @word = Word.find(params[:id])
       @word.destroy
       redirect_to words_path
   end
   
   # インポート機能 （TBD:必要か？)
   def add
       @words = Word.all
   end
   
   def tag
       @words = Word.tagged_with(params[:name])
       @tags = Word.tag_counts_on(:tags)
       
       render 'index'
   end

private
    def word_params
        params.require(:word).permit(:japanese, :thai, :english, :part_of_speech, :verbal_system, :remarks, :favorits)
    end
end
