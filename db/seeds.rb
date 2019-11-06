# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Admin.create(username: 'admin', email: 'admin@snappler.com', password: '123123', password_confirmation: '123123')
FrontendConfiguration.create(singleton_guard: 0)
