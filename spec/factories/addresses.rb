FactoryBot.define do
  factory :address do
    zipcode { "03004-001" }
    public_place { "Rua do Gasometro" }
    number { "100" }
    complement { "Complemento" }
    neighborhood { "Brás" }
    city { "São Paulo" }
    state { "SP" }
    ibge_code { "12345" }
  end
end
