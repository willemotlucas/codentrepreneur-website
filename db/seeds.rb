# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# ====================
# WARNING : Since the User.create doesn't work as it does, you need to first
# insert users matching the following lines (User.where) manually. Then, you can
# run rake db:seed to add the records in the database.
#
# INSERT INTO `website_development`.`users` (`email`, `encrypted_password`, `first_name`, `last_name`, `user_role`, `referral_code`, `created_at`, `updated_at`) VALUES ('lucas@codentrepreneur.fr', 'password', 'Lucas', 'Willemot', 'admin', 'azerty', now(), now());
# INSERT INTO `website_development`.`users` (`email`, `encrypted_password`, `first_name`, `last_name`, `user_role`, `referral_code`, `created_at`, `updated_at`) VALUES ('hajjem.alaeddine@gmail.com', 'password', 'Alaeddine', 'Hajjem', 'admin', 'qwerty', now(), now());
# INSERT INTO `website_development`.`users` (`email`, `encrypted_password`, `first_name`, `last_name`, `user_role`, `referral_code`, `created_at`, `updated_at`) VALUES ('jeandupont@gmail.com', 'password', 'Jean', 'Dupont', 'normal', 'qsdfg', now(), now());
# INSERT INTO `website_development`.`users` (`email`, `encrypted_password`, `first_name`, `last_name`, `user_role`, `referral_code`, `created_at`, `updated_at`) VALUES ('alaindurand@gmail.com', 'password', 'Alain', 'Durand', 'normal', 'poiuy', now(), now());
# =====================

Step.delete_all
FreeProject.delete_all
PaidProject.delete_all
UpcomingProject.delete_all
PreorderProject.delete_all
Task.delete_all
Payment.delete_all
Subscription.delete_all
Rating.delete_all

lucas = User.where(email: "lucas@codentrepreneur.fr").first
alaeddine = User.where(email: "hajjem.alaeddine@gmail.com").first
jean = User.where(email: "jeandupont@gmail.com").first
alain = User.where(email: "alaindurand@gmail.com").first

# Create first free project
freeProject = FreeProject.create(title: "Créez une landing page pour votre start-up", short_description: "Lorem ipsum", created_at: DateTime.now, updated_at: DateTime.now)
task1 = Task.create(title: "Tâche 1 : Préparation du projet", description: "Lorem ipsum dolor amet", order: 10, created_at: DateTime.now, updated_at: DateTime.now, taskable: freeProject)
task2 = Task.create(title: "Tâche 2 : Modification du template Bootstrap", description: "Lorem ipsum dolor amet", order: 20, created_at: DateTime.now, updated_at: DateTime.now, taskable: freeProject)
task3 = Task.create(title: "Tâche 3 : Installation des outils de tracking", description: "Lorem ipsum dolor amet", order: 30, created_at: DateTime.now, updated_at: DateTime.now, taskable: freeProject)
task4 = Task.create(title: "Tâche 4 : Mise en ligne de landing page", description: "Lorem ipsum dolor amet", order: 40, created_at: DateTime.now, updated_at: DateTime.now, taskable: freeProject)
Step.create(title: "1. Introduction", step_type: Step.step_types[:video], video_url: "https://www.youtube.com/watch?v=DI4UmIH5vSA", video_duration: "2:04", order: 10, created_at: DateTime.now, updated_at: DateTime.now, task: task1)
Step.create(title: "2. Initialisation du projet", step_type: Step.step_types[:video], video_url: "https://www.youtube.com/watch?v=DI4UmIH5vSA", video_duration: "2:04", order: 10, created_at: DateTime.now, updated_at: DateTime.now, task: task1)
Step.create(title: "3. Utilisation de Chrome Dev Tools", step_type: Step.step_types[:video], video_url: "https://www.youtube.com/watch?v=6PrQOtZMPlQ", video_duration: "3:17", order: 30, created_at: DateTime.now, updated_at: DateTime.now, task: task1)

# Create first preorder project
preorderProject = PreorderProject.create(title: "Apprenez Angular.js et Ionic en clonant Tinder", short_description: "Lorem ipsum", duration: "4 à 6h", featured: true, release_date: "Octobre 2016", original_price: 50, preorder_price: 29.90, created_at: DateTime.now, updated_at: DateTime.now)

# Create upcoming projects
UpcomingProject.create(title: "Apprenez Python en clonant BlaBlaCar", short_description: "Lorem ipsum", created_at: DateTime.now, updated_at: DateTime.now)
UpcomingProject.create(title: "Apprenez React.js en clonant Slack", short_description: "Lorem ipsum", created_at: DateTime.now, updated_at: DateTime.now)
UpcomingProject.create(title: "Apprenez Swift en clonant Instagram", short_description: "Lorem ipsum", created_at: DateTime.now, updated_at: DateTime.now)

# Create a sample paid project
paidProject = PaidProject.create(title: "Apprenez Ruby on Rails en clonant Airbnb", short_description: "Lorem ipsum", price: 50, created_at: DateTime.now, updated_at: DateTime.now)
task1 = Task.create(title: "Tâche 1 : Préparation du projet", description: "Lorem ipsum dolor amet", order: 10, created_at: DateTime.now, updated_at: DateTime.now, taskable: paidProject)
task2 = Task.create(title: "Tâche 2 : Mise en place de l'authentification", description: "Lorem ipsum dolor amet", order: 20, created_at: DateTime.now, updated_at: DateTime.now, taskable: paidProject)
Step.create(title: "1. Introduction", step_type: :video, order: 10, created_at: DateTime.now, updated_at: DateTime.now, task: task1)
Step.create(title: "2. Présentation de Ruby", step_type: Step.step_types[:video], order: 20, created_at: DateTime.now, updated_at: DateTime.now, task: task1)
Step.create(title: "3. Présentation de Rails", step_type: Step.step_types[:video], order: 30, created_at: DateTime.now, updated_at: DateTime.now, task: task1)
Step.create(title: "1. Installation de Devise", step_type: Step.step_types[:video], order: 40, created_at: DateTime.now, updated_at: DateTime.now, task: task2)
Step.create(title: "2. Mise en place du login Facebook", step_type: Step.step_types[:video], order: 50, created_at: DateTime.now, updated_at: DateTime.now, task: task2)

# Create subscriptions
Subscription.create(user: lucas, subscriptionable: freeProject)
Subscription.create(user: alaeddine, subscriptionable: freeProject)
Subscription.create(user: alain, subscriptionable: freeProject)
Subscription.create(user: alaeddine, subscriptionable: paidProject)
Subscription.create(user: jean, subscriptionable: paidProject)

# Create payments
Payment.create(user: jean, paymentable: paidProject, amount: 50, created_at: DateTime.now)
Payment.create(user: alaeddine, paymentable: paidProject, amount: 50, created_at: DateTime.now)
Payment.create(user: alain, paymentable: preorderProject, amount: 29.90, created_at: DateTime.now)
Payment.create(user: alaeddine, paymentable: preorderProject, amount: 29.90, created_at: DateTime.now)

# Create ratings
Rating.create(user: lucas, ratingable: freeProject, note: 5, comment: "Un super projet pour démarrer sa start-up !", created_at: DateTime.now)
Rating.create(user: alaeddine, ratingable: freeProject, note: 5, comment: "J'ai appris vraiment beaucoup de choses", created_at: DateTime.now)
Rating.create(user: alain, ratingable: freeProject, note: 4, created_at: DateTime.now)
Rating.create(user: alaeddine, ratingable: paidProject, note: 5, created_at: DateTime.now)
Rating.create(user: jean, ratingable: paidProject, note: 5, comment: "Grâce à cette formation, j'ai trouvé un job de développeur !", created_at: DateTime.now)
