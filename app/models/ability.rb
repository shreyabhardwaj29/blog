 class Ability
    include CanCan::Ability
  
    def initialize(user)
      if user.nil?
          can :read, [Category, Article]
      elsif user.roles.pluck(:title).include? "Admin"
          can :manage, [Category, Article]
      elsif user.roles.pluck(:title).include? "Moderator"
           can :read, Article
           can :create, Comment
           can :destroy, Comment
      elsif user.roles.pluck(:title).include? "Author"
          can :read, Article
          can :create, Article 
          can [:update, :destroy], Article do |art|
              art.article.user_id == user.id
      end
          # can :destroy, Review do |rev|
          #     rev.article.user_id == user.id
          # end
      elsif user.roles.pluck(:title).include? "User"
          can :read,:update [Category, Article]
          can [:read, :create]
          can [:update, :destroy], Comment do |review|
               review.user_id == user.id
           end
      end
    end
end
