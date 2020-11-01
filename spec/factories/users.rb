FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    password              { 'test1234' }
    password_confirmation { password }
    email                 { 'test@example.com' }
    first_name            { '山田' }
    last_name             { '太朗' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { '1992-05-06' }
  end
end