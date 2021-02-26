FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { 'abc000' }
    password_confirmation { 'abc000' }
    family_name           { '杉山' }
    first_name            { '学' }
    kana_family_name      { 'スギヤマ' }
    kana_first_name       { 'マナブ' }
    date_of_birth         { '20210119' }
  end
end
