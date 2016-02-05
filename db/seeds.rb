User.create [
  { email: 'miguel@subvisual.co', password: 'miguelpassword', name: "Miguel 'O Maquina' Palhas" },
  { email: 'laura@subvisual.co', password: 'laurapassword', name: "Laura 'Emilie' Esteves" },
  { email: 'justo@subvisual.co', password: 'justopassword', name: "Joao 'O Estupido' Justo" },
  { email: 'gabriel@subvisual.co', password: 'gabrielpassword', name: "Gabriel 'Hip-Hop' Poça" },
  { email: 'roberto@subvisual.co', password: 'robertopassword', name: "Roberto 'Chefe' Machado" },
  { email: 'zamith@subvisual.co', password: 'zamithpassword', name: "Zamith 'Basket' Luis" },
  { email: 'joao@subvisual.co', password: 'joaopassword', name: "Joao 'Syndrome' Ferreira" },
  { email: 'ronaldo@subvisual.co', password: 'ronaldopassword', name: "Ronaldo 'Nao o da bola' Freitas" },
  { email: 'bruno@subvisual.co', password: 'brunopassword', name: "Bruno 'Healthy' Azevedo" },
  { email: 'baila@subvisual.co', password: 'bailapassword', name: "Baila 'ndo' Francisco" },
  { email: 'pedro@subvisual.co', password: 'pedropassword', name: "Pedro 'Princesa' Costa" },
]

Action.create! [
  { slug: :time_report, name: 'Submit Time Report', points: 5 },
  { slug: :link_newsletter, name: 'Link Newsletter', points: 10 },
  { slug: :vacations, name: 'Vacations', points: 10 },
  { slug: :props, name: 'Receive Props', points: 50 },
  { slug: :blog_post, name: 'Write a Blog Post', points: 250 },
  { slug: :no_blog_post, name: 'No Blog Post', points: 50 },
  { slug: :friday_talk, name: 'Make a Friday Talk', points: 125 },
  { slug: :no_friday_talk, name: 'No Friday Talk', points: 25 }
]
