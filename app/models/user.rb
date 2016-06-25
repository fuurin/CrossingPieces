class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :university

  validates :email, presence: true, format: {with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/}
  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 8}, on: :create
  validates :password, allow_blank: true, length: {minimum: 8}, on: :update
  validates :comment, presence: true
  validates :country_region, presence: true
  validates :photo, length: {maximum: 5.megabytes, message: "画像ファイルの最大サイズは5MBです。"}
  validates :photo_content_type, format: {with: /\A((image\/jpeg)|(image\/png)|(image\/gif))*\z/}
end