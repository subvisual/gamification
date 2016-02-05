Event.delete_all
User.delete_all
Action.delete_all

User.create! [
  { email: 'miguel@subvisual.co', password: 'miguelpassword', name: "Miguel 'O Maquina' Palhas" },
  { email: 'laura@subvisual.co', password: 'laurapassword', name: "Laura 'Emilie' Esteves" },
  { email: 'justo@subvisual.co', password: 'justopassword', name: "Joao 'O Estupido' Justo" },
  { email: 'gabriel@subvisual.co', password: 'gabrielpassword', name: "Gabriel 'Hip-Hop' Poça" },
]

Action.create! [
  { slug: :props, name: 'Receive Props', points: 50 },
  { slug: :blog_post, name: 'Write a Blog Post', points: 250 },
  { slug: :no_blog_post, name: 'No Blog Post', points: 50 },
  { slug: :friday_talk, name: 'Make a Friday Talk', points: 125 },
  { slug: :no_friday_talk, name: 'No Friday Talk', points: 25 }
]
