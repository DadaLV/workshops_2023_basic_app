# Biblioteczka - warsztatowy poligon doświadczalny

Aplikacja warsztatowa, nasz poligon doświadczalny, na którym będziecie mogli ćwiczyć prezentowaną praktyczną wiedzę.

Kilka słów o startowej apce:
- aplikacja 'biblioteczna'
- pozwala na rejestrację (logowanie, itd.) użytkowników
- dodawanie książek
- ...ich wypożyczanie <em>(in progress)</em>
- ...oraz rezerwację książek już wypożyczonych <em>(in progress)</em>
- w każdej chwili użytkownik może podejrzeć swoje wypożyczenia/rezerwacje <em>(in progress)</em>

# Getting Started

- Ruby 3.2.1
- Rails 7.0.4.3
- Baza danych - SQLite
- Devise do obsługi użytkowników, sesji
- dodatkowo wpięte:
  - Letter opener (podgląd maili)
  - Rspec (bazowe testy)
  - FactoryBot (budowanie danych w testach)
  - Faker (fake-owe dane)
  - Rubocop (Twój strażnik czystego kodu)

# Instalacja, pierwsze odpalenie

- bundle install
- rake db:setup
- rails s

# Check!

- zarejestruj użytkownika
- dodaj książkę
- wypożycz ją <em>(in progress)</em>
- zarejestruj drugiego użytkownika
- zarezerwuj wypożyczoną książkę <em>(in progress)</em>

Jeżeli wszystko przeszło bezboleśnie: jesteś gotowy do działania!
