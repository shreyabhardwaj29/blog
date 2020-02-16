class Ability
  include CanCan::Ability

  class Ability
    include CanCan::Ability
  
    def initialize(user)
      if user.nil?
          can :read, [Category, Article]
      elsif user.role?"Admin"
          can :manage, [Category, Article]
      elsif user.role?"Moderator"
           can :read, Article
           can :create, Comment
           can :destroy, Comment
      elsif user.role?"Author"
          can :read, Article
          can :create, Article 
          can [:update, :destroy], Article do |art|
              art.article.user_id == user.id
          end
          # can :destroy, Review do |rev|
          #     rev.article.user_id == user.id
          # end
      elsif user.role?"User"
          can :read,:update [Category, Article]
          can [:read, :create]
          can [:update, :destroy], Comment do |review|
               review.user_id == user.id
           end
      end
    end
  
