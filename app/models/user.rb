class User < ActiveRecord::Base
  validates_presence_of :username # Can't empty.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :comments
  has_many :issues

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        url = "https://graph.facebook.com/" + 
              (auth.uid).to_s + 
              "?fields=name&access_token=EAAGh9CnwADwBAEmfDv9R9bw2mQiR8s9Cz4uvq8oshGvm1ijpabIxmkenYuB0DYRzkug0gw5ZAnaTBvkBARVUtiwsjMA36UUAQlZCWkoPYWaJBeCstWc0ZCVaK6gXO1wAPogEgEXkqLhjIV4osx4EVSAw21s4ZBEdu7KEwsxcQz75epsEZBP7UlmyfrDdSSdMZD"
        raw_content = RestClient.get(url)
        fbData = JSON.parse(raw_content)

        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.username = auth.info.name
        # user.username = fbData["name"]
        user.save
      end
  end
end